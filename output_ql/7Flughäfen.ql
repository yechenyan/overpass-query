[out:json][timeout:60];


(

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"GAT|Cargo|Ramp", i]
    ["aeroway"~"terminal|apron"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"GAT|Cargo|Ramp", i]
    ["aeroway"~"terminal|apron"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"GAT|Cargo|Ramp", i]
    ["aeroway"~"terminal|apron"];
);

out body 150;
>;
out skel qt;