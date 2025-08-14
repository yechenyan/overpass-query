#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import time
import json
import pathlib
from typing import List
from urllib.parse import quote

import requests


def fetch_cloudscene_data(
    city: str,
    data_centers: List[str],
    *,
    country: str = "germany",
    build_id: str = "pBzeyXuCGpV2Q5N2Iq5Ic",   # 按你给的路径段
    delay_seconds: int = 10
) -> None:
   
    city = city.strip().lower()
    country = country.strip().lower()

    out_dir = pathlib.Path(f"./data/{city}")
    out_dir.mkdir(parents=True, exist_ok=True)

    session = requests.Session()
    session.headers.update({
        "User-Agent": "Mozilla/5.0 (X11; Linux x86_64) "
                      "AppleWebKit/537.36 (KHTML, like Gecko) "
                      "Chrome/123.0.0.0 Safari/537.36"
    })

    for i, dc in enumerate(data_centers):
        dc_slug = dc.strip()  
        name_param = quote(dc_slug, safe="")

        url = (
            f"https://cloudscene.com/_next/data/{build_id}/data-center/"
            f"{country}/{city}/{dc_slug}.json"
            f"?zone={quote(country)}&market={quote(city)}&name={name_param}"
        )

        print(f"[{i+1}/{len(data_centers)}] GET {url}")
        try:
            resp = session.get(url, timeout=30)
            resp.raise_for_status()
            data = resp.json()
        except requests.RequestException as e:
            print(f"fail：{e}")
            err_path = out_dir / f"{dc_slug}.json"
            with err_path.open("w", encoding="utf-8") as f:
                json.dump({"error": str(e), "url": url}, f, ensure_ascii=False, indent=2)
            if i < len(data_centers) - 1:
                time.sleep(delay_seconds)
            continue
        except ValueError as e:
            print(f"JSON fail：{e}")
            err_path = out_dir / f"{dc_slug}.json"
            with err_path.open("w", encoding="utf-8") as f:
                json.dump({"error": "invalid json", "url": url, "raw": resp.text[:1000]}, f,
                          ensure_ascii=False, indent=2)
            if i < len(data_centers) - 1:
                time.sleep(delay_seconds)
            continue

        out_path = out_dir / f"{dc_slug}.json"
        with out_path.open("w", encoding="utf-8") as f:
            json.dump(data, f, ensure_ascii=False, indent=2)

        print(f"save:{out_path}")

        if i < len(data_centers) - 1:
            time.sleep(delay_seconds)


if __name__ == "__main__":
    city = "germany-regional"
    
    dataCenters = [
  "darz-darmstadt",
  "hetzner-online-falkenstein-data-center-park",
  "centron-centron-data-center",
  "eunetworks-eunetworks-erfurt",
  "eunetworks-eunetworks-wurzburg",
  "r-kom-datacenter-ostbayern",
  "pfalzkom-manet-datacenter-rhein-neckar-ii",
  "eunetworks-eunetworks-magdeburg",
  "mti-mannheim",
  "pfalzkom-manet-datacenter-rhein-neckar",
  "lew-telnet-augsburg",
  "noris-network-rz-hof-hof1",
  "centurylink-kehl",
  "eunetworks-eunetworks-rostock",
  "itecon-mainz",
  "arvato-systems-guetersloh",
  "intelsat-fuchsstadt",
  "datacenter-one-lev1",
  "arvato-systems-dc3",
  "amadeus-it-group-amadeus-data-centre",
  "inexio-saarlouis",
  "tops.net-bonn",
  "idkom-kempten-ii",
  "ibm-mainz",
  "fis-asp-grafenheinfeld",
  "wemacom-schwerin",
  "erdenreich-datantechnik-ingolstadt",
  "macrois-wurzberg",
  "telekommunikation-mittleres-ruhrgebiet-gelsenkirchen",
  "stadnetz-bamberg-stadtnetz-bamberg",
  "dacor-coburg",
  "k-net-telekommunikation-kaiserslautern",
  "pfalzkom-manet-mutterstadt",
  "deutsche-telekom-bordeland-biere",
  "axilaris-chemnitz",
  "dc-main-gmbh-datacenter-mainfranken",
  "cmo-internet-dienstleistungen-reutlingen","t-systems-twincore","m-net-telekommunikations-augsburg",
  "vse-net-saarland","relaix-networks-aachen","dts-systeme-herford",
  "systemec-nettetal","skyway-datacenter-data-center-saarland","university-of-augsburg-university-of-augsburg",
  'university-of-bamberg-bamberg','university-of-bayreuth-bayreuth','catholic-university-of-eichstatt-ingolstadt-eichstatt'
]











 
    fetch_cloudscene_data(city, dataCenters)
