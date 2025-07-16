[out:json][timeout:60];


(

  // query
  node({{bbox}})
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["landuse"="industrial"];
  way({{bbox}})
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["landuse"="industrial"];
  relation({{bbox}})
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["landuse"="industrial"];

  // query
  node({{bbox}})
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["industrial"="construction_company|concrete_plant"];
  way({{bbox}})
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["industrial"="construction_company|concrete_plant"];
  relation({{bbox}})
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["industrial"="construction_company|concrete_plant"];

  // query
  node({{bbox}})
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["shop"~"trade|doityourself"];
  way({{bbox}})
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["shop"~"trade|doityourself"];
  relation({{bbox}})
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["shop"~"trade|doityourself"];

  // query
  node({{bbox}})
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["building"~"industrial|industrial|commercial"];
  way({{bbox}})
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["building"~"industrial|industrial|commercial"];
  relation({{bbox}})
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["building"~"industrial|industrial|commercial"];

  // query
  node({{bbox}})
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["man_made"="works"];
  way({{bbox}})
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["man_made"="works"];
  relation({{bbox}})
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["man_made"="works"];
);

out body 100;
>;
out skel qt;