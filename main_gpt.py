
from generate_ql import generate_ql
from process_gpt import process_gpt
from  process_result_to_json import process_result_to_json
from run_overpass_query import run_overpass_query
from process_result_to_csv import process_result_to_csv

from pathlib import Path
from dotenv import load_dotenv



env_path = Path(__file__).with_name(".env")
a = load_dotenv(dotenv_path=env_path, override=False)


FILE_NAME = "9military_gpt"
CATEGORY = "military"


# process_result_to_json(f"output_query_data/{FILE_NAME}.json", f"output_result_json/{FILE_NAME}.json")
process_gpt(f"output_result_json/{FILE_NAME}.json", f"output_gpt/{FILE_NAME}.json",CATEGORY)
