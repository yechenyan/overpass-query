[out:json][timeout:60];


(

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["landuse"="industrial"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["landuse"="industrial"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["landuse"="industrial"];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["industrial"="construction_company|concrete_plant"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["industrial"="construction_company|concrete_plant"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["industrial"="construction_company|concrete_plant"];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["shop"="trade|doityourself"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["shop"="trade|doityourself"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["shop"="trade|doityourself"];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["building"="industrial|industrial|commercial"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["building"="industrial|industrial|commercial"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["building"="industrial|industrial|commercial"];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["man_made"="works"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["man_made"="works"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["man_made"="works"];
);

out body 100;
>;
out skel qt;