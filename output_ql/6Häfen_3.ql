[out:json][timeout:60];


(

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Güterbahnhof|Umschlagbahnhof|Containerbahnhof|CargoBahnhof|Rangierbahnhof|KV-Anlage", i]
    ["landuse"~"."];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Güterbahnhof|Umschlagbahnhof|Containerbahnhof|CargoBahnhof|Rangierbahnhof|KV-Anlage", i]
    ["landuse"~"."];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Güterbahnhof|Umschlagbahnhof|Containerbahnhof|CargoBahnhof|Rangierbahnhof|KV-Anlage", i]
    ["landuse"~"."];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Güterbahnhof|Umschlagbahnhof|Containerbahnhof|CargoBahnhof|Rangierbahnhof|KV-Anlage", i]
    ["railway"~"."];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Güterbahnhof|Umschlagbahnhof|Containerbahnhof|CargoBahnhof|Rangierbahnhof|KV-Anlage", i]
    ["railway"~"."];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Güterbahnhof|Umschlagbahnhof|Containerbahnhof|CargoBahnhof|Rangierbahnhof|KV-Anlage", i]
    ["railway"~"."];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Güterbahnhof|Umschlagbahnhof|Containerbahnhof|CargoBahnhof|Rangierbahnhof|KV-Anlage", i]
    ["construction"~"."];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Güterbahnhof|Umschlagbahnhof|Containerbahnhof|CargoBahnhof|Rangierbahnhof|KV-Anlage", i]
    ["construction"~"."];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Güterbahnhof|Umschlagbahnhof|Containerbahnhof|CargoBahnhof|Rangierbahnhof|KV-Anlage", i]
    ["construction"~"."];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["intermodal"="yes"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["intermodal"="yes"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["intermodal"="yes"];
);

out body 150;
>;
out skel qt;