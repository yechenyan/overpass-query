# Data Center

## Task1: National data center electricity consumption

Please refer to the following document (data source: TYNDP)
https://rlinstitutde.sharepoint.com/:x:/s/374_Retail4Multi-Use-374_internal_Team/Eafo-VwuspFMmpaSdkWG9xUBEqgF2hrue8rbXKh_NA0gWw?e=iOWmyL

## Task2:  Germany data center list
### File Structure

The final results can be found in the `result` folder:

```
datacenter/
│
├── result/                        # Final generated files
│   ├── data_all/                   # Cleaned data: cloudscene + mapdatacenter
│   ├── estimate_all/               # cloudscene + mapdatacenter with estimated generation & consumption
│   ├── data_cloudscen/             # Cleaned data from cloudscene
│   ├── estimate_cloudscen/         # cloudscene data with estimated generation & consumption
│   ├── data_mapdatacenter/         # Cleaned data from mapdatacenter
│   ├── estimate_mapdatacenter/     # mapdatacenter data with estimated generation & consumption
│
├── cloudscene/                     # Python scripts for downloading & cleaning cloudscene data
│                                    # Source: https://cloudscene.com/market/data-centers-in-germany/all
│
├── mapdatacenter/                   # Python scripts for downloading & cleaning mapdatacenter data
│                                    # Source: https://map.datacente.rs/
│
├── estimate.py                      # Python script for estimating power generation
├── merge.py                         # Python script for merging multiple data sources
```

---

### Column Descriptions for `estimate_all.csv`

- **id** – Source ID  
- **name** – Data center name  
- **company_name** – Company name  
- **m2** – Area (square meters)  
- **gross_max_power** – Power (MW)  
- **lon** – Longitude  
- **lat** – Latitude  
- **Punktgeometrie (als WKT)** – WKT geometry  
- **source** – Data source  
- **estimated_max_power_mw** – Estimated maximum power  
- **estimation_method** – Method used for estimation  
- **estimated_annual_energy_mwh** – Estimated annual energy consumption (MWh)  

---

### Estimation Methods

1. **If both area and power are missing**  
   Estimate based on data center name using the latest Borderstep research report:  
   <https://www.bitkom.org/Bitkom/Publikationen/Rechenzentren-in-Deutschland-Wirtschaftliche-Bedeutung-und-Wettbewerbssituation.html>  

2. **If power is missing but area is available**  
   Estimate using energy density.

3. **If both area and power are available**  
   Use the power value for estimation.

4. **Estimating annual energy consumption**  
   Scale according to the current total electricity consumption of German data centers (17 TWh):  
   <https://www.borderstep.de/wp-content/uploads/2022/08/Borderstep_Rechenzentren_2021_eng.pdf>

---

### Limitations

1. Most data centers are missing values — many figures are based on estimates.  
2. Naming conventions differ between cloudscene and mapdatacenter, making deduplication difficult.  
3. The scaling assumes we already have the complete list of all data centers. If this is not true, energy consumption figures will be biased.  

---

### Task3: Example Hourly Energy Consumption Data for Data Centers

- **Leibniz Supercomputing Centre** – Hourly electricity consumption for 5 days in July 2017  
  [Publication (page 4)](https://gwdg.de/hpc/_publications/iobassfeac19/publication.pdf)

- **Honda R&D Data Center Building, Hesse, Germany** – Hourly data from 2018–2023  
  <https://www.nature.com/articles/s41597-025-05186-3?error=cookies_not_supported&code=a51bcf1e-e965-4bcf-8d7a-378ea4144d59>

- **NREL RSF Measured Data 2011 (USA)** – Hourly data from the National Renewable Energy Laboratory Research Support Facility  
  <https://catalog.data.gov/dataset/nrel-rsf-measured-data-2011-c7c02>

- **TÜBİTAK ULAKBİM (Turkey)** – Daily electricity data from 2018–2021  
  <https://stat.metu.edu.tr/en/system/files/sustainability_of_metaverse.pdf>

- **Kasetsart University Data Center (Thailand)** – Hourly data from July 2018 to April 2022  
  Raw data: <https://www.scidb.cn/en/detail?dataSetId=60dfb844a69842c1b7e7ca3ba8e09791>  
  Paper: <https://energyinformatics.springeropen.com/articles/10.1186/s42162-024-00327-1>

- **HP Z440 Workstation (ESPOL, Ecuador)** – One-second sampling data for 245 days (35 weeks)  
  <https://ieee-dataport.org/open-access/data-server-energy-consumption-dataset>
