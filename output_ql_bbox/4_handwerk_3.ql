[out:json][timeout:60];


(

  // query
  node({{bbox}})
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i]
    ["amenity"~"workshop"];
  way({{bbox}})
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i]
    ["amenity"~"workshop"];
  relation({{bbox}})
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i]
    ["amenity"~"workshop"];

  // query
  node({{bbox}})
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i]
    ["man_made"~"works"];
  way({{bbox}})
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i]
    ["man_made"~"works"];
  relation({{bbox}})
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i]
    ["man_made"~"works"];

  // query
  node({{bbox}})
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i]
    ["power"~"substation"];
  way({{bbox}})
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i]
    ["power"~"substation"];
  relation({{bbox}})
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i]
    ["power"~"substation"];

  // query
  node({{bbox}})
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i]
    ["shop"="electronics|lighting"];
  way({{bbox}})
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i]
    ["shop"="electronics|lighting"];
  relation({{bbox}})
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i]
    ["shop"="electronics|lighting"];

  // query
  node({{bbox}})
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i]
    ["disused:shop"~"lighting|electronics"];
  way({{bbox}})
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i]
    ["disused:shop"~"lighting|electronics"];
  relation({{bbox}})
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i]
    ["disused:shop"~"lighting|electronics"];
);

out body 100;
>;
out skel qt;