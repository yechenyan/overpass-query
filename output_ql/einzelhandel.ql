[out:json][timeout:60];


(
  // query
  node(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["name"~"Ikea|Obi|Hornbach|Bauhaus|Hagebau|toom|Mediamarkt|Media Markt|Saturn|Poco|Roller", i]
    ["opening_hours"!~"."];
  way(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["name"~"Ikea|Obi|Hornbach|Bauhaus|Hagebau|toom|Mediamarkt|Media Markt|Saturn|Poco|Roller", i]
    ["opening_hours"!~"."];
  relation(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["name"~"Ikea|Obi|Hornbach|Bauhaus|Hagebau|toom|Mediamarkt|Media Markt|Saturn|Poco|Roller", i]
    ["opening_hours"!~"."];
  // query
  node(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["operator"~"Ikea|Obi|Hornbach|Bauhaus|Hagebau|toom|Mediamarkt|Media Markt|Saturn|Poco|Roller", i];
  way(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["operator"~"Ikea|Obi|Hornbach|Bauhaus|Hagebau|toom|Mediamarkt|Media Markt|Saturn|Poco|Roller", i];
  relation(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["operator"~"Ikea|Obi|Hornbach|Bauhaus|Hagebau|toom|Mediamarkt|Media Markt|Saturn|Poco|Roller", i];
  // query
  node(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["building"~"warehouse|retail", i]
    ["operator"~"Ikea|Obi|Hornbach|Bauhaus|Hagebau|toom|Mediamarkt|Media Markt|Saturn|Poco|Roller", i];
  way(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["building"~"warehouse|retail", i]
    ["operator"~"Ikea|Obi|Hornbach|Bauhaus|Hagebau|toom|Mediamarkt|Media Markt|Saturn|Poco|Roller", i];
  relation(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["building"~"warehouse|retail", i]
    ["operator"~"Ikea|Obi|Hornbach|Bauhaus|Hagebau|toom|Mediamarkt|Media Markt|Saturn|Poco|Roller", i];
);

out body 100;
>;
out skel qt;