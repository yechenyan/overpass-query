# 🗺️ Overpass QL Generator from JSON

This Python tool converts structured JSON-based rule definitions into [Overpass QL](https://overpass-turbo.eu/) queries for use with the Overpass API (OpenStreetMap data).

It enables flexible rule composition using exact or regex filters, supports case sensitivity flags, and outputs `.ql` files suitable for automated processing.

---

## Get start
1. Install dependencies (refer to Requirements)
2. Add queries to the `origin` folder.
3.Generate an Overpass query statement and obtain the query results.
```
python main.py
```

1. Use GPT to score the query results.
```
python main_gpt.py
```



## 🚀 Project Structure

data:

- origin/: Contains the original query definitions in JSON format.

- output_ql/: Stores the Overpass QL query files generated from the original JSON.(Automatically generated)

- output_query_data/: Holds the raw query results returned by the Overpass API.(Automatically generated)

- output_result/: Contains parsed and structured data, including names, coordinates, and areas.(Automatically generated)

code: 
- main.py: Main entry point to run the complete data processing pipeline.
  
- generate_ql.py: Generates Overpass QL query files from the JSON input.

- run_overpass_query.py: Executes the Overpass API queries using the generated QL files.

- process_result_to_csv.py: Parses Overpass API results and converts them into CSV format.



## 📦 Requirements

- Python 3.6+
- pip install requests
- pip install load_dotenv
- pip install OpenAI

---

## 🧪 JSON Format

input (origin/test.json):

```json
[
  [
    {
      "_query": "UPS charging stations",
      "name$match$i": "UPS",
      "amenity": "charging_station"
    },
    {
      "_query": "DHL commercial areas", // default: "query"
      "operator$neg$i": "DHL",
      "landuse": "commercial",
      "_types": ["node"] // default: ["node", "way", "relation"]
    }
  ]
]
```



📤 Output(output_ql/test.ql):

```
[out:json][timeout:60];

(
// UPS charging stations
  node({{bbox}})
    ["name"~"UPS", i]
    ["amenity"="charging_station"];
  way({{bbox}})
    ["name"~"UPS", i]
    ["amenity"="charging_station"];
  relation({{bbox}})
    ["name"~"UPS", i]
    ["amenity"="charging_station"];

// DHL commercial areas
  node({{bbox}})
    ["operator"!~"DHL", i]
    ["landuse"="commercial"];
);

out body 100;
>;
out skel qt;
```

## 🧠 Rule Syntax

| JSON Key Format         | Translates to Overpass QL         |
| ----------------------- | --------------------------------- |
| `key=value`             | `["key"="value"]`                 |
| `key$match=value`       | `["key"~"value"]`                 |
| `key$match$i=value`     | `["key"~"value", i]`              |
| `key$neg=value`         | `["key"!~"value"]`                |
| `key$neg$i=value`       | `["key"!~"value", i]`             |
| `_types=["node", "way", "relation"]` | Targets specific OSM object types |
| `_query=Label`          | Comment header in QL            

## How to use
```
from generate import generate_ql_from_json

# generate QL by bbox
generate_ql(f"origin/test.json")

# generate QL by Berlin
generate_ql(f"origin/{FILE_NAME}.json", 
          area= "area.target", 
          area_define='\n area["name"="Berlin"]["boundary"="administrative"]->.target; \n' )

# generate QL by latitude and longitude:
qls = generate_ql(f"origin/{FILE_NAME}.json", 
            area= "52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627", 
            area_define='' )

# query by API
for ql in qls:
  run_overpass_query(ql, output_name = "test1, output_dir="output_query_data")

# process data
process_result_to_csv(f"output_query_data/test1.json", f"output_result/{FILE_NAME}.csv")

```