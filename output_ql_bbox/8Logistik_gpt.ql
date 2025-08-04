[out:json][timeout:60];


(

  // query
  node({{bbox}})
    ["name"~"Dachser|DB Schenker|Kuehne(\s*\+\s*)?Nagel|Rhenus Logistics|Hellmann Worldwide Logistics|Nagel-Group|FIEGE Logistik|Pfenning Logistics|Noerpel|GEODIS|UPS Deutschland|FedEx Deutschland|Amazon|Zalando", i];
  way({{bbox}})
    ["name"~"Dachser|DB Schenker|Kuehne(\s*\+\s*)?Nagel|Rhenus Logistics|Hellmann Worldwide Logistics|Nagel-Group|FIEGE Logistik|Pfenning Logistics|Noerpel|GEODIS|UPS Deutschland|FedEx Deutschland|Amazon|Zalando", i];
  relation({{bbox}})
    ["name"~"Dachser|DB Schenker|Kuehne(\s*\+\s*)?Nagel|Rhenus Logistics|Hellmann Worldwide Logistics|Nagel-Group|FIEGE Logistik|Pfenning Logistics|Noerpel|GEODIS|UPS Deutschland|FedEx Deutschland|Amazon|Zalando", i];

  // query
  node({{bbox}})
    ["brand"~"Dachser|DB Schenker|Kuehne(\s*\+\s*)?Nagel|Rhenus|Hellmann|Nagel|FIEGE|Pfenning|Noerpel|GEODIS|UPS|FedEx|Amazon|Zalando", i];
  way({{bbox}})
    ["brand"~"Dachser|DB Schenker|Kuehne(\s*\+\s*)?Nagel|Rhenus|Hellmann|Nagel|FIEGE|Pfenning|Noerpel|GEODIS|UPS|FedEx|Amazon|Zalando", i];
  relation({{bbox}})
    ["brand"~"Dachser|DB Schenker|Kuehne(\s*\+\s*)?Nagel|Rhenus|Hellmann|Nagel|FIEGE|Pfenning|Noerpel|GEODIS|UPS|FedEx|Amazon|Zalando", i];
);

out body 150;
>;
out skel qt;