
from generate_ql import generate_ql
from  process_result_to_json import process_result_to_json
from run_overpass_query import run_overpass_query
from process_result_to_csv import process_result_to_csv
from dotenv import load_dotenv

load_dotenv()

FILE_NAME = "d_datacenter"
# bbox
# qls = generate_ql(f"origin/{FILE_NAME}.json")

# Berlin
#qls = generate_ql(f"origin/{FILE_NAME}.json", 
#             area= "area.target", 
#             area_define='\n area["name"="Berlin"]["boundary"="administrative"]->.target; \n' )

#  near Berlin
# qls = generate_ql(f"origin/{FILE_NAME}.json", 
#            area= "52.344149, 12.967987, 52.727144, 13.862", 
#             area_define='' )



#  nBerlin
qls = generate_ql(f"origin/{FILE_NAME}.json", 
            area= "area:3600051477", 
            area_define='' )
generate_ql(f"origin/{FILE_NAME}.json", 
            output_dir = "output_ql_bbox"
           )


for ql in qls:
  run_overpass_query(ql, output_name = FILE_NAME)

process_result_to_csv(f"output_query_data/{FILE_NAME}.json", f"output_result/{FILE_NAME}.csv")
process_result_to_json(f"output_query_data/{FILE_NAME}.json", f"output_result_json/{FILE_NAME}.json")
