[out:json][timeout:60];


(

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["leisure"="marina"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["leisure"="marina"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["leisure"="marina"];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["harbour"="yes"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["harbour"="yes"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["harbour"="yes"];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["seamark:type"="harbour"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["seamark:type"="harbour"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["seamark:type"="harbour"];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["landuse"="port"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["landuse"="port"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["landuse"="port"];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["man_made"="pier"]
    ["amenity"!~"ferry_terminal"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["man_made"="pier"]
    ["amenity"!~"ferry_terminal"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["man_made"="pier"]
    ["amenity"!~"ferry_terminal"];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["waterway"="harbour"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["waterway"="harbour"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["waterway"="harbour"];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["seamark:type"="harbour"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["seamark:type"="harbour"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["seamark:type"="harbour"];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["industrial"="quay"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["industrial"="quay"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["industrial"="quay"];
);

out body 100;
>;
out skel qt;