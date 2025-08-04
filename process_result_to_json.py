import json
import os
from math import radians, sin
from typing import List, Dict
import json


def extract_named_features(osm_data: dict) -> List[Dict]:
    elements = osm_data.get("elements", [])


    results = []

    for el in elements:
        tags = el.get("tags", None)

        if (tags == None) :
            continue

        item = {}
        if tags != None:
            item['tags'] = tags
        
       

        item = {
            "tags": tags,
            "id": el.get("id", None)
        }   

        results.append(item)     

    return results



def process_result_to_json(input_json_path: str, output_json_path: str):
    with open(input_json_path, "r", encoding="utf-8") as f:
        osm_data = json.load(f)
    features = extract_named_features(osm_data)
    os.makedirs(os.path.dirname(output_json_path), exist_ok=True)

    with open(output_json_path, "w", encoding="utf-8", newline='') as f:
        json.dump(features, f, ensure_ascii=False, indent=4)

# process_result_to_csv("output/result/input.json", "output/result/input.csv")