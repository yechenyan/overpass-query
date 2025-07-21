[out:json][timeout:60];


(

  // query
  node({{bbox}})
    ["name"~"Dachser|DB Schenker|Kuehne(\s*\+\s*)?Nagel|Rhenus Logistics|Hellmann Worldwide Logistics|Nagel-Group|FIEGE Logistik|Pfenning Logistics|Noerpel|GEODIS|UPS Deutschland|FedEx Deutschland|Amazon|Zalando", i]
    ["office"~"logistics", i]
    ["post_office:type"!~"post_partner", i]
    ["post_office"!~"post_partner", i];
  way({{bbox}})
    ["name"~"Dachser|DB Schenker|Kuehne(\s*\+\s*)?Nagel|Rhenus Logistics|Hellmann Worldwide Logistics|Nagel-Group|FIEGE Logistik|Pfenning Logistics|Noerpel|GEODIS|UPS Deutschland|FedEx Deutschland|Amazon|Zalando", i]
    ["office"~"logistics", i]
    ["post_office:type"!~"post_partner", i]
    ["post_office"!~"post_partner", i];
  relation({{bbox}})
    ["name"~"Dachser|DB Schenker|Kuehne(\s*\+\s*)?Nagel|Rhenus Logistics|Hellmann Worldwide Logistics|Nagel-Group|FIEGE Logistik|Pfenning Logistics|Noerpel|GEODIS|UPS Deutschland|FedEx Deutschland|Amazon|Zalando", i]
    ["office"~"logistics", i]
    ["post_office:type"!~"post_partner", i]
    ["post_office"!~"post_partner", i];

  // query
  node({{bbox}})
    ["name"~"Dachser|DB Schenker|Kuehne(\s*\+\s*)?Nagel|Rhenus Logistics|Hellmann Worldwide Logistics|Nagel-Group|FIEGE Logistik|Pfenning Logistics|Noerpel|GEODIS|UPS Deutschland|FedEx Deutschland|Amazon|Zalando", i]
    ["amenity"~"logistics|post_depot|post_office", i]
    ["post_office:type"!~"post_partner", i]
    ["post_office"!~"post_partner", i];
  way({{bbox}})
    ["name"~"Dachser|DB Schenker|Kuehne(\s*\+\s*)?Nagel|Rhenus Logistics|Hellmann Worldwide Logistics|Nagel-Group|FIEGE Logistik|Pfenning Logistics|Noerpel|GEODIS|UPS Deutschland|FedEx Deutschland|Amazon|Zalando", i]
    ["amenity"~"logistics|post_depot|post_office", i]
    ["post_office:type"!~"post_partner", i]
    ["post_office"!~"post_partner", i];
  relation({{bbox}})
    ["name"~"Dachser|DB Schenker|Kuehne(\s*\+\s*)?Nagel|Rhenus Logistics|Hellmann Worldwide Logistics|Nagel-Group|FIEGE Logistik|Pfenning Logistics|Noerpel|GEODIS|UPS Deutschland|FedEx Deutschland|Amazon|Zalando", i]
    ["amenity"~"logistics|post_depot|post_office", i]
    ["post_office:type"!~"post_partner", i]
    ["post_office"!~"post_partner", i];

  // query
  node({{bbox}})
    ["brand"~"Dachser|DB Schenker|Kuehne(\s*\+\s*)?Nagel|Rhenus|Hellmann|Nagel|FIEGE|Pfenning|Noerpel|GEODIS|UPS|FedEx|Amazon|Zalando", i]
    ["amenity"!~"parcel_locker", i]
    ["demolished:amenity"!~"parcel_locker", i]
    ["post_office:type"!~"post_partner", i]
    ["post_office"!~"post_partner", i];
  way({{bbox}})
    ["brand"~"Dachser|DB Schenker|Kuehne(\s*\+\s*)?Nagel|Rhenus|Hellmann|Nagel|FIEGE|Pfenning|Noerpel|GEODIS|UPS|FedEx|Amazon|Zalando", i]
    ["amenity"!~"parcel_locker", i]
    ["demolished:amenity"!~"parcel_locker", i]
    ["post_office:type"!~"post_partner", i]
    ["post_office"!~"post_partner", i];
  relation({{bbox}})
    ["brand"~"Dachser|DB Schenker|Kuehne(\s*\+\s*)?Nagel|Rhenus|Hellmann|Nagel|FIEGE|Pfenning|Noerpel|GEODIS|UPS|FedEx|Amazon|Zalando", i]
    ["amenity"!~"parcel_locker", i]
    ["demolished:amenity"!~"parcel_locker", i]
    ["post_office:type"!~"post_partner", i]
    ["post_office"!~"post_partner", i];
);

out body 100;
>;
out skel qt;