[out:json][timeout:60];


(

  // query
  node({{bbox}})
    ["name"~"DB Cargo|Contargo|DUSS|Eurogate|HHLA|duisport|TFG Transfracht|Hupac|Kombiverkehr", i]
    ["shop"!~"."];
  way({{bbox}})
    ["name"~"DB Cargo|Contargo|DUSS|Eurogate|HHLA|duisport|TFG Transfracht|Hupac|Kombiverkehr", i]
    ["shop"!~"."];
  relation({{bbox}})
    ["name"~"DB Cargo|Contargo|DUSS|Eurogate|HHLA|duisport|TFG Transfracht|Hupac|Kombiverkehr", i]
    ["shop"!~"."];

  // query
  node({{bbox}})
    ["operator"~"DB Cargo|Contargo|DUSS|Eurogate|HHLA|duisport|TFG Transfracht|Hupac|Kombiverkehr"]
    ["amenity"!~"recycling|parking|fast_food"]
    ["tourism"!~"attraction"]
    ["shop"!~"."];
  way({{bbox}})
    ["operator"~"DB Cargo|Contargo|DUSS|Eurogate|HHLA|duisport|TFG Transfracht|Hupac|Kombiverkehr"]
    ["amenity"!~"recycling|parking|fast_food"]
    ["tourism"!~"attraction"]
    ["shop"!~"."];
  relation({{bbox}})
    ["operator"~"DB Cargo|Contargo|DUSS|Eurogate|HHLA|duisport|TFG Transfracht|Hupac|Kombiverkehr"]
    ["amenity"!~"recycling|parking|fast_food"]
    ["tourism"!~"attraction"]
    ["shop"!~"."];
);

out body 150;
>;
out skel qt;