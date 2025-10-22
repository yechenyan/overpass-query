#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import argparse
import json
import sys
import time
from pathlib import Path
from typing import Dict, Any, Optional

import requests

API_TEMPLATE = "https://cloudscene.com/api/directory-service/assets/facilities/{facility_id}/location"
LOCATION_FIELDS = ["lat", "lon", "line1", "line2", "city", "region", "country", "zipCode", "search"]

# Error backoff time in seconds
ERROR_DELAY = 300  # 5 minutes


def read_json(path: Path) -> Optional[Dict[str, Any]]:
    try:
        with path.open("r", encoding="utf-8") as f:
            return json.load(f)
    except Exception as e:
        print(f"[SKIP] Failed to read JSON: {path} ({e})", file=sys.stderr)
        return None


def write_json(path: Path, data: Dict[str, Any]) -> bool:
    try:
        with path.open("w", encoding="utf-8") as f:
            json.dump(data, f, ensure_ascii=False, indent=2)
            f.write("\n")
        return True
    except Exception as e:
        print(f"[ERROR] Failed to write JSON: {path} ({e})", file=sys.stderr)
        return False


def extract_facility_id(doc: Dict[str, Any]) -> Optional[str]:
    return doc.get("pageProps", {}).get("id")


def has_lat_lon(doc: Dict[str, Any]) -> bool:
    attrs = doc.get("pageProps", {}).get("attributes", {})
    lat = attrs.get("lat")
    lon = attrs.get("lon")
    return bool(lat) and bool(lon)


def fetch_location(facility_id: str, session: requests.Session, delay_seconds: int = 30, timeout: int = 30) -> Optional[Dict[str, Any]]:
    # Delay before request
    
    url = API_TEMPLATE.format(facility_id=facility_id)
    headers = {
        "method": "GET",
        "path": f"/api/directory-service/assets/facilities/{facility_id}/location",
        "scheme": "https",
        "accept": "application/vnd.api+json",
        "accept-encoding": "gzip, deflate, br, zstd",
        "accept-language": "zh-CN,zh;q=0.9,en;q=0.8,zh-TW;q=0.7",
        "content-type": "application/vnd.api+json",
        "priority": "u=1, i",
        "sec-ch-ua": "\"Not;A=Brand\";v=\"99\", \"Google Chrome\";v=\"139\", \"Chromium\";v=\"139\"",
        "sec-ch-ua-mobile": "?0",
        "sec-ch-ua-platform": "\"macOS\"",
        "sec-fetch-dest": "empty",
        "sec-fetch-mode": "cors",
        "sec-fetch-site": "same-origin",
        "user-agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36"
    }

    try:
        resp = session.get(url, headers=headers, timeout=timeout)
        time.sleep(delay_seconds)
    except Exception as e:
        print(f"[WARN] Request failed for {facility_id}: {e}", file=sys.stderr)
        return None

    if resp.status_code != 200:
        print(f"[WARN] Non-200 status for {facility_id}: {resp.status_code}", file=sys.stderr)
        return None

    try:
        payload = resp.json()
    except Exception as e:
        print(f"[WARN] Invalid JSON response for {facility_id}: {e}", file=sys.stderr)
        return None

    attributes = payload.get("data", {}).get("attributes")
    if not isinstance(attributes, dict):
        print(f"[WARN] No attributes found for {facility_id}", file=sys.stderr)
        return None

    return attributes


def merge_location_into_doc(doc: Dict[str, Any], loc_attrs: Dict[str, Any]) -> None:
    page_props = doc.setdefault("pageProps", {})
    attributes = page_props.setdefault("attributes", {})
    for key in LOCATION_FIELDS:
        attributes[key] = loc_attrs.get(key, None)


def process_file(path: Path, session: requests.Session, delay_seconds: int) -> None:
    doc = read_json(path)
    if doc is None:
        return

    facility_id = extract_facility_id(doc)
    if not facility_id:
        print(f"[SKIP] No pageProps.id in {path}", file=sys.stderr)
        return

    if has_lat_lon(doc):
        print(f"[SKIP] lat/lon already exist: {path} (facility: {facility_id})")
        return

    loc_attrs = fetch_location(facility_id, session, delay_seconds=delay_seconds)
    if loc_attrs is None:
        print(f"[ERROR] Failed to fetch location for facility {facility_id} ({path}), waiting 5 minutes...", file=sys.stderr)
        time.sleep(ERROR_DELAY)
        return

    merge_location_into_doc(doc, loc_attrs)
    if write_json(path, doc):
        print(f"[OK] Updated: {path} (facility: {facility_id})")


def main():
    parser = argparse.ArgumentParser(description="Enrich facility JSONs with location fields.")
    parser.add_argument("--root", default="Data", help="Root folder to search for JSON files (default: Data)")
    parser.add_argument("--delay", type=int, default=10, help="Delay seconds BEFORE each API call (default: 10)")
    parser.add_argument("--glob", default="**/*.json", help="Glob pattern to match files (default: **/*.json)")
    args = parser.parse_args()

    root = Path(args.root)
    if not root.exists():
        print(f"[ERROR] Root folder not found: {root}", file=sys.stderr)
        sys.exit(1)

    json_files = sorted(root.glob(args.glob))
    if not json_files:
        print(f"[INFO] No JSON files found under: {root}")
        return

    with requests.Session() as session:
        for path in json_files:
            process_file(path, session, delay_seconds=args.delay)

    print("[DONE] All matching files processed.")


if __name__ == "__main__":
    main()
