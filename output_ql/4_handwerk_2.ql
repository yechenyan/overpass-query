[out:json][timeout:60];


(

  // query
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["landuse"="industrial"]
    ["name"!~"amt|Baumarkt|Bauhaus|Metallbau|Karosseriebau", i];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["landuse"="industrial"]
    ["name"!~"amt|Baumarkt|Bauhaus|Metallbau|Karosseriebau", i];

  // query
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["industrial"="construction_company|concrete_plant"]
    ["name"!~"amt|Baumarkt|Bauhaus|Metallbau|Karosseriebau", i];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["industrial"="construction_company|concrete_plant"]
    ["name"!~"amt|Baumarkt|Bauhaus|Metallbau|Karosseriebau", i];

  // query
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["shop"~"trade|doityourself"]
    ["name"!~"amt|Baumarkt|Bauhaus|Metallbau|Karosseriebau", i];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["shop"~"trade|doityourself"]
    ["name"!~"amt|Baumarkt|Bauhaus|Metallbau|Karosseriebau", i];

  // query
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["building"~"industrial|commercial"]
    ["name"!~"amt|Baumarkt|Bauhaus|Metallbau|Karosseriebau", i];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["building"~"industrial|commercial"]
    ["name"!~"amt|Baumarkt|Bauhaus|Metallbau|Karosseriebau", i];

  // query
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["man_made"="works"]
    ["name"!~"amt|Baumarkt|Bauhaus|Metallbau|Karosseriebau", i];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["man_made"="works"]
    ["name"!~"amt|Baumarkt|Bauhaus|Metallbau|Karosseriebau", i];
);

out body 100;
>;
out skel qt;