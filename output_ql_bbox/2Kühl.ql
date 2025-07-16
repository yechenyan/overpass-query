[out:json][timeout:60];


(

  // query
  node({{bbox}})
    ["name"~"Nagel Group|Kraftverkehr Nagel|Dachser Food Logistics|Eismann|Bofrost", i]
   ["building"];
  way({{bbox}})
    ["name"~"Nagel Group|Kraftverkehr Nagel|Dachser Food Logistics|Eismann|Bofrost", i]
   ["building"];
  relation({{bbox}})
    ["name"~"Nagel Group|Kraftverkehr Nagel|Dachser Food Logistics|Eismann|Bofrost", i]
   ["building"];

  // query
  node({{bbox}})
    ["name"~"Nagel Group|Kraftverkehr Nagel|Dachser Food Logistics|Eismann|Bofrost", i]
   ["warehouse"];
  way({{bbox}})
    ["name"~"Nagel Group|Kraftverkehr Nagel|Dachser Food Logistics|Eismann|Bofrost", i]
   ["warehouse"];
  relation({{bbox}})
    ["name"~"Nagel Group|Kraftverkehr Nagel|Dachser Food Logistics|Eismann|Bofrost", i]
   ["warehouse"];
);

out body 100;
>;
out skel qt;