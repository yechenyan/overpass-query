[out:json][timeout:60];


(
  // query
  node(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["building"="warehouse"]
    ["name"~"Metro|Transgourmet|Chefs Culinar|EGV|Selgros|Hamberger", i]
    ["opening_hours"!~"."];
  way(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["building"="warehouse"]
    ["name"~"Metro|Transgourmet|Chefs Culinar|EGV|Selgros|Hamberger", i]
    ["opening_hours"!~"."];
  relation(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["building"="warehouse"]
    ["name"~"Metro|Transgourmet|Chefs Culinar|EGV|Selgros|Hamberger", i]
    ["opening_hours"!~"."];
  // query
  node(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["landuse"="industrial"]
    ["name"~"Metro|Transgourmet|Chefs Culinar|EGV|Selgros|Hamberger", i]
    ["opening_hours"!~"."];
  way(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["landuse"="industrial"]
    ["name"~"Metro|Transgourmet|Chefs Culinar|EGV|Selgros|Hamberger", i]
    ["opening_hours"!~"."];
  relation(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["landuse"="industrial"]
    ["name"~"Metro|Transgourmet|Chefs Culinar|EGV|Selgros|Hamberger", i]
    ["opening_hours"!~"."];
  // query
  node(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["shop"="wholesale"]
    ["name"~"Metro|Transgourmet|Chefs Culinar|EGV|Selgros|Hamberger", i]
    ["opening_hours"!~"."];
  way(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["shop"="wholesale"]
    ["name"~"Metro|Transgourmet|Chefs Culinar|EGV|Selgros|Hamberger", i]
    ["opening_hours"!~"."];
  relation(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["shop"="wholesale"]
    ["name"~"Metro|Transgourmet|Chefs Culinar|EGV|Selgros|Hamberger", i]
    ["opening_hours"!~"."];
);

out body 100;
>;
out skel qt;