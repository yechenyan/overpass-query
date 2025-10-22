"""
Goal:
- Walk through all subfolders under ./Data
- Read every JSON file that contains a "facilities" style object like the provided example
- Extract required fields and merge them into a single CSV: cloudscene.csv
- NEW: lat, lon, search are read from ./location mirror files (data->attributes->lat/lon/search).
       If not found or file missing, write None.

Notes:
- Variable comments are in English as requested.
- This script is designed to be resilient to missing keys and inconsistent types.
"""

from pathlib import Path
import json
import csv

# -------- Configuration --------
DATA_ROOT = Path("Data")              # Root folder containing many subfolders with facility JSON files
LOCATION_ROOT = Path("location")      # Mirror root for location JSON files (same structure/filenames as Data)
OUTPUT_CSV = Path("cloudscene.csv")   # Output CSV filename

# Desired CSV columns (order matters)
COLUMNS = [
    "Id",
    "name",                      # From last segment of slug
    "company_name",              # Provider company name (English key)
    "m2",                        # Gross area (from buildSizeGross)
    "gross_max_power",           # Max power (from powerGenTotal)
    "lon",                       # From location/<mirror>.json -> data.attributes.lon
    "lat",                       # From location/<mirror>.json -> data.attributes.lat
    "search",                    # From location/<mirror>.json -> data.attributes.search
    "Punktgeometrie (als WKT)",  # POINT (lon lat)
    "source"                     # Constant: "cloudscene"
]

def safe_get(dct, *keys, default=None):
    """
    Safely get a deeply nested value from dict-like objects.
    Pass keys as a sequence of strings/ints for each nesting level.
    Returns 'default' if any level is missing.
    """
    cur = dct
    for k in keys:
        if isinstance(cur, dict) and k in cur:
            cur = cur[k]
        else:
            return default
    return cur

def to_float_or_none(val):
    """
    Convert numeric-like strings to float. Returns None if conversion fails or val is None/empty.
    """
    if val is None:
        return None
    if isinstance(val, (int, float)):
        return float(val)
    s = str(val).strip()
    if not s:
        return None
    # Remove common thousands separators or stray spaces
    s = s.replace(",", "").replace(" ", "")
    try:
        return float(s)
    except ValueError:
        return None

def last_slug_segment(slug, fallback_name=None):
    """
    Return the last path segment from a slug like 'germany/dusseldorf/interxion-dus-1'.
    If slug is missing/empty, fall back to provided name.
    """
    if slug and isinstance(slug, str):
        parts = [p for p in slug.strip("/").split("/") if p]
        if parts:
            return parts[-1]
    return fallback_name or None

def build_wkt(lon, lat):
    """
    Build WKT POINT string if lon/lat are available. Returns None otherwise.
    """
    if lon is None or lat is None:
        return None
    return f"POINT ({lon} {lat})"

def extract_record(payload, loc_lon, loc_lat, loc_search):
    """
    Extract a single CSV row dict from one JSON 'facilities' payload (matching the example structure),
    using location lon/lat/search provided by caller.
    """
    page = payload.get("pageProps", {})
    attrs = safe_get(page, "attributes", default={}) or {}
    provider_name = safe_get(page, "provider", "attributes", "name")
    slug = attrs.get("slug")
    fallback_display_name = attrs.get("name")

    # ID
    facility_id = page.get("id")

    # Name from last segment of slug
    name_from_slug = last_slug_segment(slug, fallback_display_name)

    # Company name
    company_name = provider_name

    # Area (m2) from buildSizeGross
    m2_val = to_float_or_none(attrs.get("buildSizeGross"))

    # Max power from powerGenTotal
    gross_max_power_val = to_float_or_none(attrs.get("powerGenTotal"))

    # WKT geometry from location lon/lat
    wkt = build_wkt(loc_lon, loc_lat)

    # Assemble the CSV row
    row = {
        "Id": facility_id,
        "name": name_from_slug,
        "company_name": company_name,
        "m2": m2_val,
        "gross_max_power": gross_max_power_val,
        "lon": loc_lon,
        "lat": loc_lat,
        "search": loc_search,
        "Punktgeometrie (als WKT)": wkt,
        "source": "cloudscene",
    }
    return row

def find_json_files(root: Path):
    """
    Yield all *.json files under the given root directory (recursive).
    """
    yield from root.rglob("*.json")

def read_location_triplet_for(data_json_path: Path):
    """
    Given a path under DATA_ROOT, read the mirror JSON under LOCATION_ROOT
    and return (lon, lat, search) with correct types; missing -> None.
    Expected structure:
      {
        "data": {
          "attributes": {
            "lat": <str|num|null>,
            "lon": <str|num|null>,
            "search": <str|null>
          }
        }
      }
    """
    try:
        # Compute relative path from DATA_ROOT, then mirror it under LOCATION_ROOT
        rel = data_json_path.relative_to(DATA_ROOT)
        loc_path = LOCATION_ROOT / rel

        if not loc_path.exists():
            return (None, None, None)

        with loc_path.open("r", encoding="utf-8") as f:
            loc_payload = json.load(f)

        lat_raw = safe_get(loc_payload, "data", "attributes", "lat")
        lon_raw = safe_get(loc_payload, "data", "attributes", "lon")
        search_val = safe_get(loc_payload, "data", "attributes", "search")

        lat = to_float_or_none(lat_raw)
        lon = to_float_or_none(lon_raw)

        # Normalize empty strings to None for search
        if isinstance(search_val, str):
            search_val = search_val.strip() or None

        return (lon, lat, search_val)
    except Exception:
        # Any error: treat as no data
        return (None, None, None)

def main():
    # Prepare output CSV with UTF-8 BOM to better support Chinese column names in Excel
    OUTPUT_CSV.parent.mkdir(parents=True, exist_ok=True)

    records_written = 0
    with OUTPUT_CSV.open("w", encoding="utf-8-sig", newline="") as f_out:
        writer = csv.DictWriter(f_out, fieldnames=COLUMNS)
        writer.writeheader()

        for json_path in find_json_files(DATA_ROOT):
            try:
                # Read JSON file
                with json_path.open("r", encoding="utf-8") as f_in:
                    data = json.load(f_in)

                # Only process if this looks like a facilities payload (optional guard)
                page_type = safe_get(data, "pageProps", "type")
                if page_type and str(page_type).lower() != "facilities":
                    # Skip non-facility JSONs
                    continue

                # Read matching location file (mirror path under LOCATION_ROOT)
                loc_lon, loc_lat, loc_search = read_location_triplet_for(json_path)

                # Extract and write row
                row = extract_record(data, loc_lon, loc_lat, loc_search)

                # Minimal validation: require Id and name
                if not row["Id"] and not row["name"]:
                    # Skip if both key identifiers are missing
                    continue

                writer.writerow(row)
                records_written += 1

            except Exception as e:
                # Soft-fail on individual files; continue processing others
                print(f"[WARN] Failed to process {json_path}: {e}")

    print(f"[INFO] Done. Wrote {records_written} records to {OUTPUT_CSV}")

if __name__ == "__main__":
    main()
