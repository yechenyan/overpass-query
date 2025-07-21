[out:json][timeout:60];


(

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Umzüge|Strabag|Züblin|Max Bögl|Hochtief|Bilfinger|Leonhard Weiss|WOLFF.*MÜLLER|Implenia|Goldbeck", i]
    ["office"="company"]
   ["building"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Umzüge|Strabag|Züblin|Max Bögl|Hochtief|Bilfinger|Leonhard Weiss|WOLFF.*MÜLLER|Implenia|Goldbeck", i]
    ["office"="company"]
   ["building"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Umzüge|Strabag|Züblin|Max Bögl|Hochtief|Bilfinger|Leonhard Weiss|WOLFF.*MÜLLER|Implenia|Goldbeck", i]
    ["office"="company"]
   ["building"];
);

out body 100;
>;
out skel qt;