import os
import json

def parse_filters(params):
    filters = []
    for key, value in params.items():
        if key in ["_types", "_query", "_last"]:
            continue

        parts = key.split("$")
        tag = parts[0]
        is_neg = "neg" in parts
        is_i = "i" in parts
        op = "!~" if is_neg else "~"

        if len(parts) == 1:
            filters.append(f'["{tag}"="{value}"]')
        else:
            i_flag = ", i" if is_i else ""
            filters.append(f'["{tag}"{op}"{value}"{i_flag}]')
    return filters

def build_overpass_ql(query_groups, area = "{{bbox}}", area_define= ""):
    result = ['[out:json][timeout:60];\n', area_define, "("]

    for group in query_groups:
        for item in group:
            query_name = item.get('_query', 'query')
            last = item.get("_last", '')
            types = item.get("_types", ["node", "way", "relation"])
            filters = parse_filters(item)

            result.append(f'\n  // {query_name}')
            for t in types:
                lines = [f'  {t}({area})']
                lines.extend([f'    {f}' for f in filters])
                if last != '':
                    lines.append(f'   {last}')
                lines[-1] += ';'  # 最后一行加分号
                result.extend(lines)
          


    result.append(');\n\nout body 150;\n>;\nout skel qt;')
    return '\n'.join(result)

def generate_ql(json_path: str,area: str = "{{bbox}}", area_define: str = "", output_dir: str = "output_ql") -> list[str]:
    
    os.makedirs(output_dir, exist_ok=True)

    with open(json_path, 'r', encoding='utf-8') as f:
        data = json.load(f)

    ql_code = build_overpass_ql(data, area, area_define)
    
    filename = os.path.splitext(os.path.basename(json_path))[0] + '.ql'
    output_path = os.path.join(output_dir, filename)

    with open(output_path, 'w', encoding='utf-8') as f:
        f.write(ql_code)

    return [ql_code]
