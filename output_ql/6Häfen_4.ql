[out:json][timeout:60];


(

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"DB Cargo|Contargo|DUSS|Eurogate|HHLA|Rhenus|duisport|TFG Transfracht|Hupac|Kombiverkehr", i]
    ["opening_hours"!~"."];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"DB Cargo|Contargo|DUSS|Eurogate|HHLA|Rhenus|duisport|TFG Transfracht|Hupac|Kombiverkehr", i]
    ["opening_hours"!~"."];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"DB Cargo|Contargo|DUSS|Eurogate|HHLA|Rhenus|duisport|TFG Transfracht|Hupac|Kombiverkehr", i]
    ["opening_hours"!~"."];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["operator"~"DB Cargo|Contargo|DUSS|Eurogate|HHLA|Rhenus|duisport|TFG Transfracht|Hupac|Kombiverkehr", i]
    ["opening_hours"!~"."]
    ["amenity"!~"recycling"]
    ["tourism"!~"attraction"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["operator"~"DB Cargo|Contargo|DUSS|Eurogate|HHLA|Rhenus|duisport|TFG Transfracht|Hupac|Kombiverkehr", i]
    ["opening_hours"!~"."]
    ["amenity"!~"recycling"]
    ["tourism"!~"attraction"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["operator"~"DB Cargo|Contargo|DUSS|Eurogate|HHLA|Rhenus|duisport|TFG Transfracht|Hupac|Kombiverkehr", i]
    ["opening_hours"!~"."]
    ["amenity"!~"recycling"]
    ["tourism"!~"attraction"];
);

out body 100;
>;
out skel qt;