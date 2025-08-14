# -*- coding: utf-8 -*-
"""
Estimate each data center's max power and annual electricity consumption,
then scale totals to match a national target (Germany: 18–20 TWh/year, default midpoint 19 TWh).

Input  CSV path: all/mergeCSV.py     (treated as CSV)
Output CSV path: allCSV.py           (as requested; CSV content with .py extension)

Added columns:
- estimated_max_power_mw (float): estimated total max facility power [MW]
- estimated_annual_energy_mwh (float): estimated annual electricity consumption [MWh]
- estimation_method (str): explanation of how the estimate was derived (in English)
"""

import math
import re
import numpy as np
import pandas as pd

# ----------------------------
# Global constants / assumptions
# ----------------------------

HOURS_PER_YEAR = 8760


TARGET_TOTAL_TWH = 17

# Typical IT power density by facility type (kW of IT load per m²).
POWER_DENSITY_KW_PER_M2 = {
    "colocation": 1.5,        # typical 1.0–2.0+
    "hosting_cloud": 1.8,     # hyperscale / cloud can be higher
    "enterprise": 1.0,        # typical 0.5–1.5
    "unknown": 1.2            # fallback midpoint
}

# Typical PUE by facility type (dimensionless), used to convert IT load -> total facility power.
PUE_BY_TYPE = {
    "colocation": 1.5,        # ~1.4–1.7 common; modern down to ~1.3
    "hosting_cloud": 1.35,    # hyperscale ~1.2–1.4
    "enterprise": 1.6,        # older enterprise often 1.5–2.0
    "unknown": 1.5
}

# Load factor (average utilization of max facility power over the year).
LOAD_FACTOR_BY_TYPE = {
    "colocation": 0.65,
    "hosting_cloud": 0.60,
    "enterprise": 0.50,
    "unknown": 0.55
}

# Regex-based heuristics to infer facility type from company/name.
FACILITY_TYPE_PATTERNS = [
    (r"\b(equinix|digital\s*realty|interxion|nlighten|northc|colo|colt)\b", "colocation"),
    (r"\b(aws|amazon|gcp|google|microsoft|azure|facebook|meta)\b", "hosting_cloud"),
    (r"\b(hetzner|contabo|ovh|ionos|1\s*&\s*1|versatel|plusserver|myloc|datev|arvato|noris|key-?systems)\b", "hosting_cloud"),
    (r"\b(t-?systems|ibm|atos|siemens|amadeus|verizon|orange|bt|kpn|dts)\b", "enterprise"),
]

# ----------------------------
# Helpers
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

def estimate_power_row(row: pd.Series) -> tuple[float, str, str]:
    """
    Per-row estimation logic.

    Returns:
        (estimated_max_power_mw, estimation_method, inferred_type)
    """
    m2 = coerce_float(row.get("m2"))
    reported_mw = coerce_float(row.get("gross_max_power"))
    ftype = classify_facility_type(row)

    # If a valid reported gross_max_power exists, trust it.
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

    # Otherwise we will try company/global statistics later.
    return np.nan, "pending_company_or_global_fallback", ftype

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

def _append_method(existing, extra_tag):
    """Append a semicolon-delimited tag to estimation_method safely."""
    base = str(existing) if pd.notna(existing) else ""
    return (base + (";" if base else "") + extra_tag)

def compute_annual_energy(row: pd.Series) -> float:
    """
    Annual energy [MWh] = estimated_max_power_mw * load_factor[type] * 8760.
    Note: estimated_max_power_mw is TOTAL facility power (not IT-only).
    """
    est_mw = coerce_float(row.get("estimated_max_power_mw"))
    ftype = row.get("_facility_type", "unknown") or "unknown"
    load_factor = LOAD_FACTOR_BY_TYPE.get(ftype, LOAD_FACTOR_BY_TYPE["unknown"])
    if est_mw is None or math.isnan(est_mw):
        return np.nan
    return est_mw * load_factor * HOURS_PER_YEAR

# ----------------------------
# Main transformation
# ----------------------------

def main():
    src_path = "result/data_mapdatacenter.csv"   # as requested
    out_path = "result/estimate.csv"         # as requested

    # Read CSV (even if extension is .py)
    df = pd.read_csv(src_path, low_memory=False)

    # Ensure required columns exist
    for col in ["name", "company_name", "m2", "gross_max_power", "lon", "lat", "source"]:
        if col not in df.columns:
            df[col] = np.nan

    # First pass estimation
    results = df.apply(estimate_power_row, axis=1, result_type="expand")
    results.columns = ["estimated_max_power_mw", "estimation_method", "_facility_type"]
    df = pd.concat([df, results], axis=1)

    # Second pass completion
    df = finalize_with_company_means(df)

    # Compute annual energy (pre-scaling)
    df["estimated_annual_energy_mwh"] = df.apply(compute_annual_energy, axis=1)

    # ----------------------------
    # National scaling to 18–20 TWh (default midpoint)
    # ----------------------------
    current_total_mwh = df["estimated_annual_energy_mwh"].sum(skipna=True)
    target_total_mwh = TARGET_TOTAL_TWH * 1_000_000.0  # TWh -> MWh

    if current_total_mwh and not math.isnan(current_total_mwh) and current_total_mwh > 0:
        scale_factor = target_total_mwh / current_total_mwh

        # Scale both max power and annual energy so that totals align with national target
        df["estimated_max_power_mw"] = df["estimated_max_power_mw"] * scale_factor
        df["estimated_annual_energy_mwh"] = df["estimated_annual_energy_mwh"] * scale_factor

        # Mark method
        df["estimation_method"] = df["estimation_method"].apply(
            lambda s: _append_method(s, f"scaled_to_{TARGET_TOTAL_TWH:.1f}TWh(factor={scale_factor:.3f})")
        )

    # Drop helper column before saving
    if "_facility_type" in df.columns:
        df.drop(columns=["_facility_type"], inplace=True)

    # Save (CSV content, .py extension as requested)
    df.to_csv(out_path, index=False)

if __name__ == "__main__":
    # Not executing by request. To run locally, uncomment:
    main()
    
