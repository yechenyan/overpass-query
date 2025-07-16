[out:json][timeout:60];


(

  // query
  node({{bbox}})
    ["name"~"Ikea|Obi|Hornbach|Bauhaus|Hagebau|toom|Mediamarkt|Media Markt|Saturn|Poco|Roller", i]
   ["shop"];
  way({{bbox}})
    ["name"~"Ikea|Obi|Hornbach|Bauhaus|Hagebau|toom|Mediamarkt|Media Markt|Saturn|Poco|Roller", i]
   ["shop"];
  relation({{bbox}})
    ["name"~"Ikea|Obi|Hornbach|Bauhaus|Hagebau|toom|Mediamarkt|Media Markt|Saturn|Poco|Roller", i]
   ["shop"];

  // query
  node({{bbox}})
    ["operator"~"Ikea|Obi|Hornbach|Bauhaus|Hagebau|toom|Mediamarkt|Media Markt|Saturn|Poco|Roller", i]
   ["shop"];
  way({{bbox}})
    ["operator"~"Ikea|Obi|Hornbach|Bauhaus|Hagebau|toom|Mediamarkt|Media Markt|Saturn|Poco|Roller", i]
   ["shop"];
  relation({{bbox}})
    ["operator"~"Ikea|Obi|Hornbach|Bauhaus|Hagebau|toom|Mediamarkt|Media Markt|Saturn|Poco|Roller", i]
   ["shop"];

  // query
  node({{bbox}})
    ["building"~"Ikea|Obi|Hornbach|Bauhaus|Hagebau|toom|Mediamarkt|Media Markt|Saturn|Poco|Roller", i]
   ["shop"];
  way({{bbox}})
    ["building"~"Ikea|Obi|Hornbach|Bauhaus|Hagebau|toom|Mediamarkt|Media Markt|Saturn|Poco|Roller", i]
   ["shop"];
  relation({{bbox}})
    ["building"~"Ikea|Obi|Hornbach|Bauhaus|Hagebau|toom|Mediamarkt|Media Markt|Saturn|Poco|Roller", i]
   ["shop"];
);

out body 100;
>;
out skel qt;