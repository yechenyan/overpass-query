[out:json][timeout:60];


(

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Dachser|DB Schenker|Kuehne(\s*\+\s*)?Nagel|Rhenus Logistics|Hellmann Worldwide Logistics|Nagel-Group|FIEGE Logistik|Pfenning Logistics|Noerpel|GEODIS|UPS Deutschland|FedEx Deutschland|Amazon|Zalando", i]
    ["office"~"logistics", i]
    ["post_office:type"!~"post_partner", i]
    ["post_office"!~"post_partner", i];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Dachser|DB Schenker|Kuehne(\s*\+\s*)?Nagel|Rhenus Logistics|Hellmann Worldwide Logistics|Nagel-Group|FIEGE Logistik|Pfenning Logistics|Noerpel|GEODIS|UPS Deutschland|FedEx Deutschland|Amazon|Zalando", i]
    ["office"~"logistics", i]
    ["post_office:type"!~"post_partner", i]
    ["post_office"!~"post_partner", i];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Dachser|DB Schenker|Kuehne(\s*\+\s*)?Nagel|Rhenus Logistics|Hellmann Worldwide Logistics|Nagel-Group|FIEGE Logistik|Pfenning Logistics|Noerpel|GEODIS|UPS Deutschland|FedEx Deutschland|Amazon|Zalando", i]
    ["office"~"logistics", i]
    ["post_office:type"!~"post_partner", i]
    ["post_office"!~"post_partner", i];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Dachser|DB Schenker|Kuehne(\s*\+\s*)?Nagel|Rhenus Logistics|Hellmann Worldwide Logistics|Nagel-Group|FIEGE Logistik|Pfenning Logistics|Noerpel|GEODIS|UPS Deutschland|FedEx Deutschland|Amazon|Zalando", i]
    ["amenity"~"logistics|post_depot|post_office", i]
    ["post_office:type"!~"post_partner", i]
    ["post_office"!~"post_partner", i];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Dachser|DB Schenker|Kuehne(\s*\+\s*)?Nagel|Rhenus Logistics|Hellmann Worldwide Logistics|Nagel-Group|FIEGE Logistik|Pfenning Logistics|Noerpel|GEODIS|UPS Deutschland|FedEx Deutschland|Amazon|Zalando", i]
    ["amenity"~"logistics|post_depot|post_office", i]
    ["post_office:type"!~"post_partner", i]
    ["post_office"!~"post_partner", i];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Dachser|DB Schenker|Kuehne(\s*\+\s*)?Nagel|Rhenus Logistics|Hellmann Worldwide Logistics|Nagel-Group|FIEGE Logistik|Pfenning Logistics|Noerpel|GEODIS|UPS Deutschland|FedEx Deutschland|Amazon|Zalando", i]
    ["amenity"~"logistics|post_depot|post_office", i]
    ["post_office:type"!~"post_partner", i]
    ["post_office"!~"post_partner", i];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["brand"~"Dachser|DB Schenker|Kuehne(\s*\+\s*)?Nagel|Rhenus|Hellmann|Nagel|FIEGE|Pfenning|Noerpel|GEODIS|UPS|FedEx|Amazon|Zalando", i]
    ["amenity"!~"parcel_locker", i]
    ["demolished:amenity"!~"parcel_locker", i]
    ["post_office:type"!~"post_partner", i]
    ["post_office"!~"post_partner", i];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["brand"~"Dachser|DB Schenker|Kuehne(\s*\+\s*)?Nagel|Rhenus|Hellmann|Nagel|FIEGE|Pfenning|Noerpel|GEODIS|UPS|FedEx|Amazon|Zalando", i]
    ["amenity"!~"parcel_locker", i]
    ["demolished:amenity"!~"parcel_locker", i]
    ["post_office:type"!~"post_partner", i]
    ["post_office"!~"post_partner", i];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["brand"~"Dachser|DB Schenker|Kuehne(\s*\+\s*)?Nagel|Rhenus|Hellmann|Nagel|FIEGE|Pfenning|Noerpel|GEODIS|UPS|FedEx|Amazon|Zalando", i]
    ["amenity"!~"parcel_locker", i]
    ["demolished:amenity"!~"parcel_locker", i]
    ["post_office:type"!~"post_partner", i]
    ["post_office"!~"post_partner", i];
);

out body 100;
>;
out skel qt;