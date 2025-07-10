import json
import os
import csv
from math import radians, sin
from typing import List, Dict

def extract_named_features(osm_data: dict) -> List[Dict]:
    elements = osm_data.get("elements", [])
    node_lookup = {el["id"]: el for el in elements if el["type"] == "node"}
    way_lookup = {el["id"]: el for el in elements if el["type"] == "way"}

    results = []

    for el in elements:
        tags = el.get("tags", {})
        name = tags.get("name")
        if not name:
            continue

        el_type = el["type"]

        if el_type == "node":
            results.append({
                "type": "node",
                "name": name,
                "lat": el["lat"],
                "lon": el["lon"],
                "area_m2": 0
            })

        elif el_type == "way":
            node_ids = el.get("nodes", [])
            coords = [(node_lookup[nid]["lat"], node_lookup[nid]["lon"]) for nid in node_ids if nid in node_lookup]
            if len(coords) >= 3:
                area = estimate_polygon_area(coords)
                center_lat = sum(c[0] for c in coords) / len(coords)
                center_lon = sum(c[1] for c in coords) / len(coords)
                results.append({
                    "type": "way",
                    "name": name,
                    "lat": center_lat,
                    "lon": center_lon,
                    "area_m2": area
                })

        elif el_type == "relation":
            coords = []
            for member in el.get("members", []):
                if member["type"] == "way":
                    way = way_lookup.get(member["ref"])
                    if not way:
                        continue
                    node_ids = way.get("nodes", [])
                    coords.extend([
                        (node_lookup[nid]["lat"], node_lookup[nid]["lon"])
                        for nid in node_ids if nid in node_lookup
                    ])

            if len(coords) >= 3:
                area = estimate_polygon_area(coords)
                center_lat = sum(c[0] for c in coords) / len(coords)
                center_lon = sum(c[1] for c in coords) / len(coords)
                results.append({
                    "type": "relation",
                    "name": name,
                    "lat": center_lat,
                    "lon": center_lon,
                    "area_m2": area
                })

    return results

def estimate_polygon_area(coords):
    if coords[0] != coords[-1]:
        coords.append(coords[0])
    R = 6371000
    area = 0.0
    for i in range(len(coords) - 1):
        lat1 = radians(coords[i][0])
        lon1 = radians(coords[i][1])
        lat2 = radians(coords[i + 1][0])
        lon2 = radians(coords[i + 1][1])
        area += (lon2 - lon1) * (2 + sin(lat1) + sin(lat2))
    return abs(area * R * R / 2.0)

def save_features_to_csv(features: List[Dict], output_csv_path: str):
    os.makedirs(os.path.dirname(output_csv_path), exist_ok=True)
    with open(output_csv_path, "w", encoding="utf-8", newline='') as csvfile:
        writer = csv.DictWriter(csvfile, fieldnames=["type", "name", "lat", "lon", "area_m2"])
        writer.writeheader()
        for f in features:
            writer.writerow(f)
    print(f"✔ CSV saved to: {output_csv_path}")

def process_result_to_csv(input_json_path: str, output_csv_path: str):
    with open(input_json_path, "r", encoding="utf-8") as f:
        osm_data = json.load(f)
    features = extract_named_features(osm_data)
    save_features_to_csv(features, output_csv_path)

# process_result_to_csv("output/result/input.json", "output/result/input.csv")