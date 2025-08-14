import json
import pandas as pd

json_path = "./data.json"

csv_path = "./datacenter.csv"

with open(json_path, "r", encoding="utf-8") as f:
    data = json.load(f)

rows = []
for feat in data['features']:
    props = feat.get("properties", {})
    geom = feat.get("geometry", {})
    coords = geom.get("coordinates", [None, None])  
    lon = coords[0]
    lat = coords[1]
    country = props['country']

    wkt = f"POINT ({lon} {lat})" if lon and lat else None
    if country == 'Germany':
        rows.append({
            "id": props.get('id'),
            "name": props.get("name"),
            "company_name": props.get("company_name"),
            "m2": props.get("m2"),
            "gross_max_power": props.get("gross_max_power"),
            "lon": lon,
            "lat": lat,
            "Punktgeometrie (als WKT)": wkt,
            "source": "mapdatacenter"
        })

df = pd.DataFrame(rows, columns=[
    "id",
    "name",
    "company_name",
    "m2",
    "gross_max_power",
    "lon",
    "lat",
    "Punktgeometrie (als WKT)",
    "source"
])

df.to_csv(csv_path, index=False, encoding="utf-8")

print(f"CSV file created：{csv_path}")
