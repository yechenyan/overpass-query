[out:json][timeout:60];


(

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"DB Cargo|Contargo|DUSS|Eurogate|HHLA|duisport|TFG Transfracht|Hupac|Kombiverkehr", i]
    ["shop"!~"."];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"DB Cargo|Contargo|DUSS|Eurogate|HHLA|duisport|TFG Transfracht|Hupac|Kombiverkehr", i]
    ["shop"!~"."];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"DB Cargo|Contargo|DUSS|Eurogate|HHLA|duisport|TFG Transfracht|Hupac|Kombiverkehr", i]
    ["shop"!~"."];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["operator"~"DB Cargo|Contargo|DUSS|Eurogate|HHLA|duisport|TFG Transfracht|Hupac|Kombiverkehr"]
    ["amenity"!~"recycling|parking|fast_food"]
    ["tourism"!~"attraction"]
    ["shop"!~"."];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["operator"~"DB Cargo|Contargo|DUSS|Eurogate|HHLA|duisport|TFG Transfracht|Hupac|Kombiverkehr"]
    ["amenity"!~"recycling|parking|fast_food"]
    ["tourism"!~"attraction"]
    ["shop"!~"."];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["operator"~"DB Cargo|Contargo|DUSS|Eurogate|HHLA|duisport|TFG Transfracht|Hupac|Kombiverkehr"]
    ["amenity"!~"recycling|parking|fast_food"]
    ["tourism"!~"attraction"]
    ["shop"!~"."];
);

out body 150;
>;
out skel qt;