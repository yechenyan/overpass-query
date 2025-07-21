[out:json][timeout:60];


(

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Metro|Transgourmet|Chefs Culinar|EGV|Selgros|Hamberger", i]
    ["shop"="wholesale"]
   ["building"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Metro|Transgourmet|Chefs Culinar|EGV|Selgros|Hamberger", i]
    ["shop"="wholesale"]
   ["building"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Metro|Transgourmet|Chefs Culinar|EGV|Selgros|Hamberger", i]
    ["shop"="wholesale"]
   ["building"];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Metro|Transgourmet|Chefs Culinar|EGV|Selgros|Hamberger", i]
    ["building"="warehouse"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Metro|Transgourmet|Chefs Culinar|EGV|Selgros|Hamberger", i]
    ["building"="warehouse"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Metro|Transgourmet|Chefs Culinar|EGV|Selgros|Hamberger", i]
    ["building"="warehouse"];
);

out body 100;
>;
out skel qt;