# pip install openai
from typing import List, Dict, Any
from openai import OpenAI
import json
import os
import json




# 1) Configuration
MODEL = "gpt-4o"  # Can be replaced with any model you have access to

# 2) Structured output: Require the model to strictly produce the specified fields and types
SCHEMA = {
    "type": "object",
    "additionalProperties": False,
    "properties": {
        "items": {
            "type": "array",
            "items": {
                "type": "object",
                "additionalProperties": False,
                "properties": {
                    "id": {"type": "integer"},
                    "N1": {"type": "number", "minimum": 0, "maximum": 1},
                    "N2": {"type": "number", "minimum": 0, "maximum": 1},
                    "N3": {"type": "number", "minimum": 0, "maximum": 1},
                    "N3S": {"type": "number", "minimum": 0, "maximum": 1},
                    "locationRelated": {"type": "number", "minimum": 0, "maximum": 1},
                    "note": {"type": "string",}
                },
                "required": ["id", "N1", "N2", "N3", "N3S", "locationRelated", "note"]
            },
            "minItems": 1
        }
    },
    "required": ["items"]
}

SYSTEM_PROMPT = """
List of locations 中的每地点会经常较长停靠哪种类型的卡车？ 
请用 1- 10 的范围来表示每种类型的卡车停靠的可能性。 1 表示不可能停靠，10 表示非常可能停靠。

另外请在 locationRelated 中评估此地点是否属于 location category/requirement。 请用 1- 10 的范围来表示相关性。 1 表示不相关，10 表示非常相关。
问这个问题是考虑是否在这个地方建立电动卡车充电站


Output JSON only (strictly following the schema), 
with no additional explanations."""

USER_INSTRUCTION = """Field meanings:
- N1: 小于3.5顿的小型卡车
- N2: 3.5顿-12顿的中型顿卡车
- N3: 12-26顿重型车辆（如吊车）
- N3S: 超过 26顿的超重性卡车
- locationRelated: 和  “location category/requirement hint 的相关性。
- note: 用中文介绍原因
Output JSON only."""

def score_places(places: List[Dict[str, Any]], category_hint: str) -> List[Dict[str, Any]]:
  """
  places: List of locations to evaluate (including tags, id, etc.)
  category_hint: The “location category/requirement hint” provided by the user
  """
  # Create a compact and readable context from user data
  text = f"""
  {USER_INSTRUCTION}
  My location category/requirement hint (as provided): {category_hint}

  List of locations to evaluate (raw JSON) as follows:str({places})

  """
    
    
    # [
    #     {"type": "text", "text": USER_INSTRUCTION},
    #     {"type": "text", "text": f"My location category/requirement hint (as provided): {category_hint}"},
    #     {"type": "text", "text": "List of locations to evaluate (raw JSON) as follows:"},
    #     {"type": "input_text", "text": str(places)}
    # ]

  client = OpenAI()  # Reads environment variable OPENAI_API_KEY

  print('Sending request to OpenAI API...')
  resp = client.chat.completions.create(
  model=MODEL,
  temperature=0.2,
  response_format={
      "type": "json_schema",
      "json_schema": {"name": "truck_parking_probabilities", "schema": SCHEMA, "strict": True}
  },
  messages=[
      {"role": "system", "content": [{"type": "text", "text": SYSTEM_PROMPT}]},
      {"role": "user",   "content": [
          {"type": "text", "text": text},
      ]}
  ]
  )
  print('Received response from OpenAI API.')

  # Unified output reading method for the Responses API
  # Get the text of the first output item (guaranteed to match the schema JSON string)
  msg = resp.choices[0].message
  if isinstance(msg.content, list):
    text = msg.content[0].text
  else:
    text = msg.content

  data = json.loads(text)   
  return data


def merge(result_json, gpt_json):
    """
    Merge the original result JSON with the GPT scores.
    """
    for item in result_json:
        item_id = item.get("id")
        for gpt_item in gpt_json["items"]:
            if gpt_item["id"] == item_id:
                item.update(gpt_item)
                break
    return result_json


def process_gpt_filter(input_json_path: str, output_json_path: str, category_hint: str):
    with open(input_json_path, "r", encoding="utf-8") as f:
        places = json.load(f)

    gpt_json = score_places(places, category_hint)

    results = merge(places, gpt_json)
    
    os.makedirs(os.path.dirname(output_json_path), exist_ok=True)

    with open(output_json_path, "w", encoding="utf-8", newline='') as f:
        json.dump(results, f, ensure_ascii=False, indent=4)