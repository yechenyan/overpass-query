[out:json][timeout:60];


(

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Ikea|Obi|Hornbach|Bauhaus|Hagebau|toom|Mediamarkt|Media Markt|Saturn|Poco|Roller", i]
   ["shop"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Ikea|Obi|Hornbach|Bauhaus|Hagebau|toom|Mediamarkt|Media Markt|Saturn|Poco|Roller", i]
   ["shop"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Ikea|Obi|Hornbach|Bauhaus|Hagebau|toom|Mediamarkt|Media Markt|Saturn|Poco|Roller", i]
   ["shop"];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["operator"~"Ikea|Obi|Hornbach|Bauhaus|Hagebau|toom|Mediamarkt|Media Markt|Saturn|Poco|Roller", i]
   ["shop"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["operator"~"Ikea|Obi|Hornbach|Bauhaus|Hagebau|toom|Mediamarkt|Media Markt|Saturn|Poco|Roller", i]
   ["shop"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["operator"~"Ikea|Obi|Hornbach|Bauhaus|Hagebau|toom|Mediamarkt|Media Markt|Saturn|Poco|Roller", i]
   ["shop"];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["building"~"Ikea|Obi|Hornbach|Bauhaus|Hagebau|toom|Mediamarkt|Media Markt|Saturn|Poco|Roller", i]
   ["shop"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["building"~"Ikea|Obi|Hornbach|Bauhaus|Hagebau|toom|Mediamarkt|Media Markt|Saturn|Poco|Roller", i]
   ["shop"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["building"~"Ikea|Obi|Hornbach|Bauhaus|Hagebau|toom|Mediamarkt|Media Markt|Saturn|Poco|Roller", i]
   ["shop"];
);

out body 100;
>;
out skel qt;