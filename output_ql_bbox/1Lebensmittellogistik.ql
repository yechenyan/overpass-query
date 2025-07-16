[out:json][timeout:60];


(

  // query
  node({{bbox}})
    ["name"~"Metro|Transgourmet|Chefs Culinar|EGV|Selgros|Hamberger", i]
    ["shop"="wholesale"];
  way({{bbox}})
    ["name"~"Metro|Transgourmet|Chefs Culinar|EGV|Selgros|Hamberger", i]
    ["shop"="wholesale"];
  relation({{bbox}})
    ["name"~"Metro|Transgourmet|Chefs Culinar|EGV|Selgros|Hamberger", i]
    ["shop"="wholesale"];

  // query
  node({{bbox}})
    ["name"~"Metro|Transgourmet|Chefs Culinar|EGV|Selgros|Hamberger", i]
    ["building"="wholesale"];
  way({{bbox}})
    ["name"~"Metro|Transgourmet|Chefs Culinar|EGV|Selgros|Hamberger", i]
    ["building"="wholesale"];
  relation({{bbox}})
    ["name"~"Metro|Transgourmet|Chefs Culinar|EGV|Selgros|Hamberger", i]
    ["building"="wholesale"];
);

out body 100;
>;
out skel qt;