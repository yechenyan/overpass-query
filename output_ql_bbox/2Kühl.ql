[out:json][timeout:60];


(

  // query
  node({{bbox}})
    ["name"~"Nagel Group|Kraftverkehr Nagel|Dachser Food Logistics|Dachser", i]
   ["building"];
  way({{bbox}})
    ["name"~"Nagel Group|Kraftverkehr Nagel|Dachser Food Logistics|Dachser", i]
   ["building"];
  relation({{bbox}})
    ["name"~"Nagel Group|Kraftverkehr Nagel|Dachser Food Logistics|Dachser", i]
   ["building"];

  // query
  node({{bbox}})
    ["name"~"Nagel Group|Kraftverkehr Nagel|Dachser Food Logistics|Dachser", i]
   ["warehouse"];
  way({{bbox}})
    ["name"~"Nagel Group|Kraftverkehr Nagel|Dachser Food Logistics|Dachser", i]
   ["warehouse"];
  relation({{bbox}})
    ["name"~"Nagel Group|Kraftverkehr Nagel|Dachser Food Logistics|Dachser", i]
   ["warehouse"];
);

out body 100;
>;
out skel qt;