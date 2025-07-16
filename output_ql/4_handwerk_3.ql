[out:json][timeout:60];


(

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i]
    ["amenity"~"workshop"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i]
    ["amenity"~"workshop"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i]
    ["amenity"~"workshop"];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i]
    ["man_made"~"works"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i]
    ["man_made"~"works"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i]
    ["man_made"~"works"];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i]
    ["power"~"substation"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i]
    ["power"~"substation"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i]
    ["power"~"substation"];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i]
    ["shop"="electronics|lighting"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i]
    ["shop"="electronics|lighting"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i]
    ["shop"="electronics|lighting"];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i]
    ["disused:shop"~"lighting|electronics"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i]
    ["disused:shop"~"lighting|electronics"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i]
    ["disused:shop"~"lighting|electronics"];
);

out body 100;
>;
out skel qt;