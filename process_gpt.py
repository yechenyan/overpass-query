# pip install openai
from typing import List, Dict, Any
from openai import OpenAI
import json
import os
import json




# 1) Configuration
MODEL = "gpt-4o"  # Can be replaced with any model you have access to

# 2) Structured output: Require the model to strictly produce the specified fields and types


USER_INSTRUCTION = """

What type of trucks are likely to stop for a longer time at the following location?
1 means most likely, 0 means least likely.
The purpose of this question is to consider whether to build an electric truck charging station at this location.

Please return the answer in JSON format. Example:
{
    "items": [
        {
            "id": 123456,
            "N1": 0.8,   // Probability of small trucks (< 3.5 tons) stopping
            "N2": 0.5,   // Probability of medium trucks (3.5–12 tons) stopping
            "N3": 0.2,   // Probability of large trucks (12–26 tons) or heavy vehicles stopping
            "N3S": 0.1,  // Probability of extra heavy vehicles (> 26 tons) stopping
            "locationRelated": 0.9, // Relevance to location category/requirement
            "note": "This location often has small trucks stopping, likely due to nearby supermarkets or small stores."
        }
    ]
}
Please output in the above format for every location in the List of locations without missing any.

with no additional explanations."""


def score_places(places: List[Dict[str, Any]], category_hint: str) -> List[Dict[str, Any]]:
  
  # Create a compact and readable context from user data
  text = f"""
  {USER_INSTRUCTION}

  My location category/requirement: {category_hint}
  List of locations to evaluate (raw JSON) as follows:str({places})
  """

  client = OpenAI()  # Reads environment variable OPENAI_API_KEY

  print('Sending request to OpenAI API...')
  resp = client.chat.completions.create(
  model=MODEL,
  temperature=0.2,
  response_format={
      "type": "json_object",
  },
  messages=[
    #   {"role": "system", "content": [{"type": "text", "text": SYSTEM_PROMPT}]},
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


def process_gpt (input_json_path: str, output_json_path: str, category_hint: str):
    with open(input_json_path, "r", encoding="utf-8") as f:
        places = json.load(f)
    print('go')
    gpt_json = score_places(places, category_hint)
    with open(f"test.json", "w", encoding="utf-8", newline='') as f:
        json.dump(gpt_json, f, ensure_ascii=False, indent=4)

    results = merge(places, gpt_json)
    
    os.makedirs(os.path.dirname(output_json_path), exist_ok=True)

    with open(output_json_path, "w", encoding="utf-8", newline='') as f:
        json.dump(results, f, ensure_ascii=False, indent=4)