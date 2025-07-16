[out:json][timeout:60];


(
  // query
  node(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i]
    ["opening_hours"!~"."];
  way(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i]
    ["opening_hours"!~"."];
  relation(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i]
    ["opening_hours"!~"."];
  // query
  node(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["office"="construction"]
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i];
  way(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["office"="construction"]
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i];
  relation(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["office"="construction"]
    ["name"~"Elektro|Elektrotechnik|Elektriker|Sanitär|Heizung|SHK|Klima|Lüftung|Haustechnik|Gebäudetechnik|Licht|Solartechnik|Photovoltaik", i];
  // query
  node(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["shop"="electrical"];
  way(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["shop"="electrical"];
  relation(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["shop"="electrical"];
);

out body 100;
>;
out skel qt;