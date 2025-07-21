[out:json][timeout:60];


(

  // query
  node({{bbox}})
    ["name"~"bofrost|eismann", i]
   ["building"];
  way({{bbox}})
    ["name"~"bofrost|eismann", i]
   ["building"];
  relation({{bbox}})
    ["name"~"bofrost|eismann", i]
   ["building"];

  // query
  node({{bbox}})
    ["name"~"bofrost|eismann", i]
   ["warehouse"];
  way({{bbox}})
    ["name"~"bofrost|eismann", i]
   ["warehouse"];
  relation({{bbox}})
    ["name"~"bofrost|eismann", i]
   ["warehouse"];
);

out body 100;
>;
out skel qt;