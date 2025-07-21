[out:json][timeout:60];


(

  // query
  node({{bbox}})
    ["name"~"Umzüge|Strabag|Züblin|Max Bögl|Hochtief|Bilfinger|Leonhard Weiss|WOLFF.*MÜLLER|Implenia|Goldbeck", i]
    ["office"="company"]
   ["building"];
  way({{bbox}})
    ["name"~"Umzüge|Strabag|Züblin|Max Bögl|Hochtief|Bilfinger|Leonhard Weiss|WOLFF.*MÜLLER|Implenia|Goldbeck", i]
    ["office"="company"]
   ["building"];
  relation({{bbox}})
    ["name"~"Umzüge|Strabag|Züblin|Max Bögl|Hochtief|Bilfinger|Leonhard Weiss|WOLFF.*MÜLLER|Implenia|Goldbeck", i]
    ["office"="company"]
   ["building"];
);

out body 100;
>;
out skel qt;