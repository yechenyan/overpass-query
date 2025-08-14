"""
Goal:
- Walk through all subfolders under ./Data
- Read every JSON file that contains a "facilities" style object like the provided example
- Extract required fields and merge them into a single CSV: cloudscene.csv

Notes:
- Variable comments are in English as requested.
- This script is designed to be resilient to missing keys and inconsistent types.
"""

from pathlib import Path
import json
import csv

# -------- Configuration --------
DATA_ROOT = Path("Data")           # Root folder containing many subfolders with JSON files
OUTPUT_CSV = Path("cloudscene.csv")  # Output CSV filename

# Desired CSV columns (order matters)
COLUMNS = [
    "Id",
    "name",                      # From last segment of slug
    "company_name",              # Provider company name (English key)
    "m2",                        # Gross area (from buildSizeGross)
    "gross_max_power",           # Max power (from powerGenTotal)
    "lon",
    "lat",
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

def extract_record(payload):
    """
    Extract a single CSV row dict from one JSON 'facilities' payload (matching the example structure).
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

    # Company name (both English key and Chinese duplicate)
    company_name = provider_name
    company_name_cn = provider_name

    # Area (m2) from buildSizeGross
    m2_val = to_float_or_none(attrs.get("buildSizeGross"))

    # Max power from powerGenTotal
    gross_max_power_val = to_float_or_none(attrs.get("powerGenTotal"))

    # Coordinates priority:
    # 1) pageProps.attributes.lon/lat (if present in some files)
    # 2) pageProps.location.* (if a location object exists in some variants)
    # 3) pageProps.market.attributes.lon/lat (rare)
    # 4) pageProps.zone.attributes.lon/lat (country-level fallback)
    lon = (
        to_float_or_none(attrs.get("lon"))
        or to_float_or_none(safe_get(page, "location", "attributes", "lon"))
        or to_float_or_none(safe_get(page, "market", "attributes", "lon"))
        or to_float_or_none(safe_get(page, "zone", "attributes", "lon"))
    )
    lat = (
        to_float_or_none(attrs.get("lat"))
        or to_float_or_none(safe_get(page, "location", "attributes", "lat"))
        or to_float_or_none(safe_get(page, "market", "attributes", "lat"))
        or to_float_or_none(safe_get(page, "zone", "attributes", "lat"))
    )

    # WKT geometry
    wkt = build_wkt(lon, lat)

    # Assemble the CSV row
    row = {
        "Id": facility_id,
        "name": name_from_slug,
        "company_name": company_name,
        "m2": m2_val,
        "gross_max_power": gross_max_power_val,
        "lon": lon,
        "lat": lat,
        "Punktgeometrie (als WKT)": wkt,
        "source": "cloudscene",
    }
    return row

def find_json_files(root: Path):
    """
    Yield all *.json files under the given root directory (recursive).
    """
    yield from root.rglob("*.json")

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

                # Extract and write row
                row = extract_record(data)

                # Minimal validation: require Id and name
                if not row["Id"] and not row["name"]:
                    # Skip if both key identifiers are missing
                    continue

                writer.writerow(row)
                records_written += 1

            except Exception as e:
                # Soft-fail on individual files; continue processing others
                # You can replace this print with logging if needed.
                print(f"[WARN] Failed to process {json_path}: {e}")

    print(f"[INFO] Done. Wrote {records_written} records to {OUTPUT_CSV}")

if __name__ == "__main__":
    main()
