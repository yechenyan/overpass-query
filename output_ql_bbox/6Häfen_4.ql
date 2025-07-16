[out:json][timeout:60];


(

  // query
  node({{bbox}})
    ["name"~"DB Cargo|Contargo|DUSS|Eurogate|HHLA|Rhenus|duisport|TFG Transfracht|Hupac|Kombiverkehr", i]
    ["opening_hours"!~"."];
  way({{bbox}})
    ["name"~"DB Cargo|Contargo|DUSS|Eurogate|HHLA|Rhenus|duisport|TFG Transfracht|Hupac|Kombiverkehr", i]
    ["opening_hours"!~"."];
  relation({{bbox}})
    ["name"~"DB Cargo|Contargo|DUSS|Eurogate|HHLA|Rhenus|duisport|TFG Transfracht|Hupac|Kombiverkehr", i]
    ["opening_hours"!~"."];

  // query
  node({{bbox}})
    ["operator"~"DB Cargo|Contargo|DUSS|Eurogate|HHLA|Rhenus|duisport|TFG Transfracht|Hupac|Kombiverkehr", i]
    ["opening_hours"!~"."]
    ["amenity"!~"recycling"]
    ["tourism"!~"attraction"];
  way({{bbox}})
    ["operator"~"DB Cargo|Contargo|DUSS|Eurogate|HHLA|Rhenus|duisport|TFG Transfracht|Hupac|Kombiverkehr", i]
    ["opening_hours"!~"."]
    ["amenity"!~"recycling"]
    ["tourism"!~"attraction"];
  relation({{bbox}})
    ["operator"~"DB Cargo|Contargo|DUSS|Eurogate|HHLA|Rhenus|duisport|TFG Transfracht|Hupac|Kombiverkehr", i]
    ["opening_hours"!~"."]
    ["amenity"!~"recycling"]
    ["tourism"!~"attraction"];
);

out body 100;
>;
out skel qt;