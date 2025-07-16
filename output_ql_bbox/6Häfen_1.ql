[out:json][timeout:60];


(

  // query
  node({{bbox}})
    ["leisure"="marina"];
  way({{bbox}})
    ["leisure"="marina"];
  relation({{bbox}})
    ["leisure"="marina"];

  // query
  node({{bbox}})
    ["harbour"="yes"];
  way({{bbox}})
    ["harbour"="yes"];
  relation({{bbox}})
    ["harbour"="yes"];

  // query
  node({{bbox}})
    ["seamark:type"="harbour"];
  way({{bbox}})
    ["seamark:type"="harbour"];
  relation({{bbox}})
    ["seamark:type"="harbour"];

  // query
  node({{bbox}})
    ["landuse"="port"];
  way({{bbox}})
    ["landuse"="port"];
  relation({{bbox}})
    ["landuse"="port"];

  // query
  node({{bbox}})
    ["man_made"="pier"]
    ["amenity"!~"ferry_terminal"];
  way({{bbox}})
    ["man_made"="pier"]
    ["amenity"!~"ferry_terminal"];
  relation({{bbox}})
    ["man_made"="pier"]
    ["amenity"!~"ferry_terminal"];

  // query
  node({{bbox}})
    ["waterway"="harbour"];
  way({{bbox}})
    ["waterway"="harbour"];
  relation({{bbox}})
    ["waterway"="harbour"];

  // query
  node({{bbox}})
    ["seamark:type"="harbour"];
  way({{bbox}})
    ["seamark:type"="harbour"];
  relation({{bbox}})
    ["seamark:type"="harbour"];

  // query
  node({{bbox}})
    ["industrial"="quay"];
  way({{bbox}})
    ["industrial"="quay"];
  relation({{bbox}})
    ["industrial"="quay"];
);

out body 100;
>;
out skel qt;