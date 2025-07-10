[out:json][timeout:60];


(
  // test1
  node(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["name"~"(^|[^a-zA-Z0-9])(UPS)([- ]|$)", i]
    ["name"!~"Bank|Filiale", i]
    ["amenity"="charging_station"];
  way(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["name"~"(^|[^a-zA-Z0-9])(UPS)([- ]|$)", i]
    ["name"!~"Bank|Filiale", i]
    ["amenity"="charging_station"];
  // test2
  node(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["name"~"(^|[^a-zA-Z0-9])(DHL)([- ]|$)"]
    ["name"!~"Bank|Filiale"]
    ["landuse"="commercial"];
  way(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["name"~"(^|[^a-zA-Z0-9])(DHL)([- ]|$)"]
    ["name"!~"Bank|Filiale"]
    ["landuse"="commercial"];
);

out body 100;
>;
out skel qt;