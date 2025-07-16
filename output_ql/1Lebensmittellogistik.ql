[out:json][timeout:60];


(

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Metro|Transgourmet|Chefs Culinar|EGV|Selgros|Hamberger", i]
    ["shop"="wholesale"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Metro|Transgourmet|Chefs Culinar|EGV|Selgros|Hamberger", i]
    ["shop"="wholesale"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Metro|Transgourmet|Chefs Culinar|EGV|Selgros|Hamberger", i]
    ["shop"="wholesale"];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Metro|Transgourmet|Chefs Culinar|EGV|Selgros|Hamberger", i]
    ["building"="wholesale"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Metro|Transgourmet|Chefs Culinar|EGV|Selgros|Hamberger", i]
    ["building"="wholesale"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Metro|Transgourmet|Chefs Culinar|EGV|Selgros|Hamberger", i]
    ["building"="wholesale"];
);

out body 100;
>;
out skel qt;