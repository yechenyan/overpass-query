import pandas as pd

# ---------- Load ----------
df_cloud = pd.read_csv('cloudscene/cloudscene.csv')
df_map = pd.read_csv('mapdatacenter/mapdatacenter.csv')

# Normalize key column name to `id`
df_cloud = df_cloud.rename(columns={'Id': 'id'})

# ---------- Outer merge (row OR) ----------
df = pd.merge(
    df_cloud,
    df_map,
    on='id',
    how='outer',
    suffixes=('_cloud', '_map')
)

# ---------- Helper: treat empty/whitespace-only or 0 (for lon/lat) as NA ----------
def to_na(series):
    s = series
    # Empty string / whitespace → NA
    if pd.api.types.is_string_dtype(s):
        s = s.replace(r'^\s*$', pd.NA, regex=True)
    # For lon/lat columns, also treat 0 as NA
    if s.name in ['lon_cloud', 'lon_map', 'lat_cloud', 'lat_map']:
        s = s.replace(0, pd.NA)
    return s

# ---------- Build the unified column set ----------
cloud_cols = [c for c in df_cloud.columns if c != 'id']
map_cols   = [c for c in df_map.columns if c != 'id']
base_names = sorted(set(cloud_cols) | set(map_cols))

# Assemble output DataFrame
out = pd.DataFrame({'id': df['id']})

for base in base_names:
    c_cloud = f'{base}_cloud'
    c_map   = f'{base}_map'

    if c_cloud in df.columns and c_map in df.columns:
        s_cloud = to_na(df[c_cloud])
        s_map   = to_na(df[c_map])
        out[base] = s_cloud.combine_first(s_map)
    elif c_cloud in df.columns:
        out[base] = df[c_cloud]
    elif c_map in df.columns:
        out[base] = df[c_map]
    else:
        out[base] = pd.NA

# ---------- Special handling for `source` ----------
source_cloud_col = 'source_cloud' if 'source_cloud' in df.columns else None
source_map_col   = 'source_map'   if 'source_map'   in df.columns else None

if source_cloud_col or source_map_col:
    def merge_sources(row):
        vals = []
        if source_cloud_col and pd.notna(row.get(source_cloud_col)):
            vals.append(str(row[source_cloud_col]))
        if source_map_col and pd.notna(row.get(source_map_col)):
            vals.append(str(row[source_map_col]))
        seen = set()
        uniq = []
        for v in vals:
            if v not in seen:
                uniq.append(v)
                seen.add(v)
        return ','.join(uniq) if uniq else pd.NA

    out['source'] = df.apply(merge_sources, axis=1)

# ---------- Optional: column order tweaks ----------
preferred_order = [
    'id', 'name', 'company_name', 'm2', 'gross_max_power',
    'lon', 'lat', 'Punktgeometrie (als WKT)', 'source'
]
ordered = [c for c in preferred_order if c in out.columns] + \
          [c for c in out.columns if c not in preferred_order]
out = out[ordered]

# ---------- Save ----------
out.to_csv('merged_datacenters.csv', index=False)
