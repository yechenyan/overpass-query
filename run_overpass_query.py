import requests
import json
import os

def run_overpass_query(ql: str, output_name:str = '', output_dir: str = "output_query_data", api_url: str = "https://overpass-api.de/api/interpreter"):
    # base_filename = os.path.splitext(os.path.basename(overpassql_path))[0]

    # result_dir = os.path.join(output_dir)
    # os.makedirs(result_dir, exist_ok=True)
    output_json_path = os.path.join(output_dir, f"{output_name}.json")

    # with open(overpassql_path, "r", encoding="utf-8") as f:
    #     query = f.read()

    print(f"⏳ Sending query to Overpass API")

    try:
        response = requests.post(api_url, data={"data": ql}, timeout=60)
        response.raise_for_status()
        result = response.json()
    except Exception as e:
        print(f"❌ Failed to fetch data from Overpass API: {e}")
        return

    with open(output_json_path, "w", encoding="utf-8") as out_f:
        json.dump(result, out_f, indent=2)

    print(f"✔ Query result saved to: {output_json_path}")

