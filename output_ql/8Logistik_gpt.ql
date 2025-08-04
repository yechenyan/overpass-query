[out:json][timeout:60];


(

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Dachser|DB Schenker|Kuehne(\s*\+\s*)?Nagel|Rhenus Logistics|Hellmann Worldwide Logistics|Nagel-Group|FIEGE Logistik|Pfenning Logistics|Noerpel|GEODIS|UPS Deutschland|FedEx Deutschland|Amazon|Zalando", i];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Dachser|DB Schenker|Kuehne(\s*\+\s*)?Nagel|Rhenus Logistics|Hellmann Worldwide Logistics|Nagel-Group|FIEGE Logistik|Pfenning Logistics|Noerpel|GEODIS|UPS Deutschland|FedEx Deutschland|Amazon|Zalando", i];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Dachser|DB Schenker|Kuehne(\s*\+\s*)?Nagel|Rhenus Logistics|Hellmann Worldwide Logistics|Nagel-Group|FIEGE Logistik|Pfenning Logistics|Noerpel|GEODIS|UPS Deutschland|FedEx Deutschland|Amazon|Zalando", i];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["brand"~"Dachser|DB Schenker|Kuehne(\s*\+\s*)?Nagel|Rhenus|Hellmann|Nagel|FIEGE|Pfenning|Noerpel|GEODIS|UPS|FedEx|Amazon|Zalando", i];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["brand"~"Dachser|DB Schenker|Kuehne(\s*\+\s*)?Nagel|Rhenus|Hellmann|Nagel|FIEGE|Pfenning|Noerpel|GEODIS|UPS|FedEx|Amazon|Zalando", i];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["brand"~"Dachser|DB Schenker|Kuehne(\s*\+\s*)?Nagel|Rhenus|Hellmann|Nagel|FIEGE|Pfenning|Noerpel|GEODIS|UPS|FedEx|Amazon|Zalando", i];
);

out body 150;
>;
out skel qt;