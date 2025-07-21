[out:json][timeout:60];


(

  // query
  node({{bbox}})
    ["name"~"Güterbahnhof|Umschlagbahnhof|Containerbahnhof|CargoBahnhof|Rangierbahnhof|KV-Anlage", i]
    ["landuse"~"."];
  way({{bbox}})
    ["name"~"Güterbahnhof|Umschlagbahnhof|Containerbahnhof|CargoBahnhof|Rangierbahnhof|KV-Anlage", i]
    ["landuse"~"."];
  relation({{bbox}})
    ["name"~"Güterbahnhof|Umschlagbahnhof|Containerbahnhof|CargoBahnhof|Rangierbahnhof|KV-Anlage", i]
    ["landuse"~"."];

  // query
  node({{bbox}})
    ["name"~"Güterbahnhof|Umschlagbahnhof|Containerbahnhof|CargoBahnhof|Rangierbahnhof|KV-Anlage", i]
    ["railway"~"."];
  way({{bbox}})
    ["name"~"Güterbahnhof|Umschlagbahnhof|Containerbahnhof|CargoBahnhof|Rangierbahnhof|KV-Anlage", i]
    ["railway"~"."];
  relation({{bbox}})
    ["name"~"Güterbahnhof|Umschlagbahnhof|Containerbahnhof|CargoBahnhof|Rangierbahnhof|KV-Anlage", i]
    ["railway"~"."];

  // query
  node({{bbox}})
    ["name"~"Güterbahnhof|Umschlagbahnhof|Containerbahnhof|CargoBahnhof|Rangierbahnhof|KV-Anlage", i]
    ["construction"~"."];
  way({{bbox}})
    ["name"~"Güterbahnhof|Umschlagbahnhof|Containerbahnhof|CargoBahnhof|Rangierbahnhof|KV-Anlage", i]
    ["construction"~"."];
  relation({{bbox}})
    ["name"~"Güterbahnhof|Umschlagbahnhof|Containerbahnhof|CargoBahnhof|Rangierbahnhof|KV-Anlage", i]
    ["construction"~"."];

  // query
  node({{bbox}})
    ["intermodal"="yes"];
  way({{bbox}})
    ["intermodal"="yes"];
  relation({{bbox}})
    ["intermodal"="yes"];
);

out body 150;
>;
out skel qt;