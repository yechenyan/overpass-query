[out:json][timeout:60];


(

  // query
  node({{bbox}})
    ["name"~"Metro|Transgourmet|Chefs Culinar|EGV|Selgros|Hamberger", i]
    ["shop"="wholesale"]
   ["building"];
  way({{bbox}})
    ["name"~"Metro|Transgourmet|Chefs Culinar|EGV|Selgros|Hamberger", i]
    ["shop"="wholesale"]
   ["building"];
  relation({{bbox}})
    ["name"~"Metro|Transgourmet|Chefs Culinar|EGV|Selgros|Hamberger", i]
    ["shop"="wholesale"]
   ["building"];

  // query
  node({{bbox}})
    ["name"~"Metro|Transgourmet|Chefs Culinar|EGV|Selgros|Hamberger", i]
    ["building"="warehouse"];
  way({{bbox}})
    ["name"~"Metro|Transgourmet|Chefs Culinar|EGV|Selgros|Hamberger", i]
    ["building"="warehouse"];
  relation({{bbox}})
    ["name"~"Metro|Transgourmet|Chefs Culinar|EGV|Selgros|Hamberger", i]
    ["building"="warehouse"];
);

out body 100;
>;
out skel qt;