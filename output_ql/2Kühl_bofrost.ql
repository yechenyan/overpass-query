[out:json][timeout:60];


(

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"bofrost|eismann", i]
   ["building"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"bofrost|eismann", i]
   ["building"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"bofrost|eismann", i]
   ["building"];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"bofrost|eismann", i]
   ["warehouse"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"bofrost|eismann", i]
   ["warehouse"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"bofrost|eismann", i]
   ["warehouse"];
);

out body 100;
>;
out skel qt;