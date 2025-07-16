[out:json][timeout:60];


(

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i];
);

out body 100;
>;
out skel qt;