[out:json][timeout:60];


(
  // query
  node(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["name"~"Nagel Group|Kraftverkehr Nagel|Dachser Food Logistics|Eismann|Bofrost", i];
  way(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["name"~"Nagel Group|Kraftverkehr Nagel|Dachser Food Logistics|Eismann|Bofrost", i];
  relation(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["name"~"Nagel Group|Kraftverkehr Nagel|Dachser Food Logistics|Eismann|Bofrost", i];
  // query
  node(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["operator"~"Nagel Group|Kraftverkehr Nagel|Dachser Food Logistics|Eismann|Bofrost", i];
  way(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["operator"~"Nagel Group|Kraftverkehr Nagel|Dachser Food Logistics|Eismann|Bofrost", i];
  relation(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["operator"~"Nagel Group|Kraftverkehr Nagel|Dachser Food Logistics|Eismann|Bofrost", i];
  // query
  node(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["brand"~"Nagel Group|Kraftverkehr Nagel|Dachser Food Logistics|Eismann|Bofrost", i];
  way(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["brand"~"Nagel Group|Kraftverkehr Nagel|Dachser Food Logistics|Eismann|Bofrost", i];
  relation(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["brand"~"Nagel Group|Kraftverkehr Nagel|Dachser Food Logistics|Eismann|Bofrost", i];
  // query
  node(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["building"~"warehouse", i]
    ["operator"~"Ikea|Obi|Hornbach|Bauhaus|Hagebau|toom|Mediamarkt|Media Markt|Saturn|Poco|Roller", i];
  way(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["building"~"warehouse", i]
    ["operator"~"Ikea|Obi|Hornbach|Bauhaus|Hagebau|toom|Mediamarkt|Media Markt|Saturn|Poco|Roller", i];
  relation(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["building"~"warehouse", i]
    ["operator"~"Ikea|Obi|Hornbach|Bauhaus|Hagebau|toom|Mediamarkt|Media Markt|Saturn|Poco|Roller", i];
  // query
  node(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["landuse"="industrial"]
    ["name"~"Nagel Group|Kraftverkehr Nagel|Dachser Food Logistics|Eismann|Bofrost", i];
  way(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["landuse"="industrial"]
    ["name"~"Nagel Group|Kraftverkehr Nagel|Dachser Food Logistics|Eismann|Bofrost", i];
  relation(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["landuse"="industrial"]
    ["name"~"Nagel Group|Kraftverkehr Nagel|Dachser Food Logistics|Eismann|Bofrost", i];
);

out body 100;
>;
out skel qt;