[out:json][timeout:60];


(

  // query
  node({{bbox}})
    ["aeroway"="aerodrome"];
  way({{bbox}})
    ["aeroway"="aerodrome"];
  relation({{bbox}})
    ["aeroway"="aerodrome"];
);

out body 100;
>;
out skel qt;