[out:json][timeout:60];


(

  // query
  node({{bbox}})
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i];
  way({{bbox}})
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i];
  relation({{bbox}})
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i];
);

out body 100;
>;
out skel qt;