[out:json][timeout:60];


(

  // query
  node({{bbox}})
    ["name"~"GAT|Cargo|Ramp", i]
    ["aeroway"~"terminal|apron"];
  way({{bbox}})
    ["name"~"GAT|Cargo|Ramp", i]
    ["aeroway"~"terminal|apron"];
  relation({{bbox}})
    ["name"~"GAT|Cargo|Ramp", i]
    ["aeroway"~"terminal|apron"];
);

out body 150;
>;
out skel qt;