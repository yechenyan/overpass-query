# -*- coding: utf-8 -*-
"""
Estimate per-site max power and annual electricity consumption for German data centers,
then scale ONLY the annual energy totals to match a national target (18–20 TWh/year, default 19 TWh).

Rules:
- If 'gross_max_power' is valid (>0), use it directly for estimated_max_power_mw.
- If missing, estimate from area (m2) via IT power density and PUE by facility type.
- Annual energy is computed ONLY from estimated_max_power_mw with a type-based load factor:
    estimated_annual_energy_mwh = estimated_max_power_mw * load_factor * 5000
- ONLY estimated_annual_energy_mwh is scaled to match national total; max power is NOT scaled.
- Keep 2 decimals for the two estimated numeric columns.
"""

import math
import re
import numpy as np
import pandas as pd

# ----------------------------
# Global constants / assumptions
# ----------------------------

HOURS_PER_YEAR = 5000
TARGET_TOTAL_TWH = 20.6

POWER_DENSITY_KW_PER_M2 = {
    "colocation": 1.5,
    "hosting_cloud": 1.8,
    "enterprise": 1.0,
    "unknown": 1.2
}

PUE_BY_TYPE = {
    "colocation": 1.5,
    "hosting_cloud": 1.35,
    "enterprise": 1.6,
    "unknown": 1.5
}

LOAD_FACTOR_BY_TYPE = {
    "colocation": 0.65,
    "hosting_cloud": 0.60,
    "enterprise": 0.50,
    "unknown": 0.55
}

FACILITY_TYPE_PATTERNS = [
    (r"\b(equinix|digital\s*realty|interxion|nlighten|northc|colo|colt)\b", "colocation"),
    (r"\b(aws|amazon|gcp|google|microsoft|azure|facebook|meta)\b", "hosting_cloud"),
    (r"\b(hetzner|contabo|ovh|ionos|1\s*&\s*1|versatel|plusserver|myloc|datev|arvato|noris|key-?systems)\b", "hosting_cloud"),
    (r"\b(t-?systems|ibm|atos|siemens|amadeus|verizon|orange|bt|kpn|dts)\b", "enterprise"),
]

# ----------------------------
# Helper functions
# ----------------------------

def classify_facility_type(row: pd.Series) -> str:
    """Infer facility type from company_name/name using regex rules."""
    text = " ".join([
        str(row.get("company_name", "")),
        str(row.get("name", "")),
    ]).lower()
    for pat, ftype in FACILITY_TYPE_PATTERNS:
        if re.search(pat, text, flags=re.IGNORECASE):
            return ftype
    return "unknown"

def coerce_float(x):
    """Convert value to float; return np.nan if not possible."""
    try:
        if x is None:
            return np.nan
        if isinstance(x, (int, float, np.number)):
            return float(x)
        s = str(x).strip()
        if s == "" or s.lower() in {"nan", "none", "null"}:
            return np.nan
        return float(s)
    except Exception:
        return np.nan

def estimate_power_row(row: pd.Series):
    """
    Per-row estimation logic.

    Returns:
        (estimated_max_power_mw, estimation_method, facility_type)
    """
    m2 = coerce_float(row.get("m2"))
    reported_mw = coerce_float(row.get("gross_max_power"))
    ftype = classify_facility_type(row)

    # If a valid reported gross_max_power exists, use it directly.
    if reported_mw is not None and not math.isnan(reported_mw) and reported_mw > 0:
        return reported_mw, "reported_gross_max_power", ftype

    # If area is available, synthesize total facility power from IT density and PUE.
    if m2 is not None and not math.isnan(m2) and m2 > 0:
        density = POWER_DENSITY_KW_PER_M2.get(ftype, POWER_DENSITY_KW_PER_M2["unknown"])
        pue = PUE_BY_TYPE.get(ftype, PUE_BY_TYPE["unknown"])
        it_kw = m2 * density
        total_kw = it_kw * pue
        est_mw = total_kw / 1000.0
        return est_mw, f"density_model:type={ftype};density_kW_per_m2={density};pue={pue}", ftype

    # Otherwise mark as missing; will try company/global statistics later.
    return np.nan, "pending_company_or_global_fallback", ftype

def _append_method(existing, extra_tag):
    """Append a semicolon-delimited tag to estimation_method safely."""
    base = str(existing) if pd.notna(existing) else ""
    return (base + (";" if base else "") + extra_tag)

def finalize_with_company_means(df: pd.DataFrame) -> pd.DataFrame:
    """
    For rows still missing power, try company mean of already estimated values.
    If still missing, fill with global median.
    """
    company_means = (
        df.loc[df["estimated_max_power_mw"].notna()]
          .groupby("company_name")["estimated_max_power_mw"]
          .mean()
    )

    need_fill = df["estimated_max_power_mw"].isna()
    for idx in df.index[need_fill]:
        comp = df.at[idx, "company_name"]
        mean_val = company_means.get(comp, np.nan) if isinstance(company_means, pd.Series) else np.nan
        if pd.notna(mean_val):
            df.at[idx, "estimated_max_power_mw"] = float(mean_val)
            df.at[idx, "estimation_method"] = _append_method(df.at[idx, "estimation_method"], "company_mean_estimate")

    # Global fallback: median of existing estimates
    if df["estimated_max_power_mw"].notna().any():
        global_median = float(df["estimated_max_power_mw"].median(skipna=True))
        need_fill = df["estimated_max_power_mw"].isna()
        df.loc[need_fill, "estimated_max_power_mw"] = global_median
        df.loc[need_fill, "estimation_method"] = df.loc[need_fill, "estimation_method"].apply(
            lambda s: _append_method(s, "global_median_fallback")
        )

    return df

def compute_annual_energy(row: pd.Series) -> float:
    """
    Annual energy [MWh] = estimated_max_power_mw * load_factor[type] * 5000.
    """
    est_mw = coerce_float(row.get("estimated_max_power_mw"))
    ftype = row.get("facility_type", "unknown") or "unknown"
    load_factor = LOAD_FACTOR_BY_TYPE.get(ftype, LOAD_FACTOR_BY_TYPE["unknown"])
    if est_mw is None or math.isnan(est_mw):
        return np.nan
    return est_mw * load_factor * HOURS_PER_YEAR

# ----------------------------
# Main transformation
# ----------------------------

def main():
    src_path = "cloudscene/cloudscene.csv"
    out_path = "DE_datacenter_list/cloudscene_2024.csv"

    # src_path = "mapdatacenter/mapdatacenter.csv"
    # out_path = "DE_datacenter_list/mapdatacenter_2024.csv"

    df = pd.read_csv(src_path, sep=",", low_memory=False)

    for col in ["name", "company_name", "m2", "gross_max_power", "lon", "lat", "source"]:
        if col not in df.columns:
            df[col] = np.nan

    # Estimation
    results = df.apply(estimate_power_row, axis=1, result_type="expand")
    results.columns = ["estimated_max_power_mw", "estimation_method", "facility_type"]
    df = pd.concat([df, results], axis=1)

    # Fill missing max power
    df = finalize_with_company_means(df)

    # Compute annual energy (before scaling)
    df["estimated_annual_energy_mwh"] = df.apply(compute_annual_energy, axis=1)

    # Scale ONLY annual energy
    current_total_mwh = df["estimated_annual_energy_mwh"].sum(skipna=True)
    target_total_mwh = TARGET_TOTAL_TWH * 1_000_000.0

    if current_total_mwh and not math.isnan(current_total_mwh) and current_total_mwh > 0:
        scale_factor = target_total_mwh / current_total_mwh
        df["estimated_annual_energy_mwh"] *= scale_factor
        df["estimation_method"] = df["estimation_method"].apply(
            lambda s: _append_method(s, f"annual_energy_scaled_to_{TARGET_TOTAL_TWH:.1f}TWh(factor={scale_factor:.3f})")
        )

    # Round to 2 decimals
    df["estimated_max_power_mw"] = df["estimated_max_power_mw"].round(2)
    df["estimated_annual_energy_mwh"] = df["estimated_annual_energy_mwh"].round(2)

    # Export (keep facility_type)
    df.to_csv(out_path, index=False, sep=";")
    print(f"✅ Output written to {out_path}")
    print("Columns:", list(df.columns))


if __name__ == "__main__":
    main()
