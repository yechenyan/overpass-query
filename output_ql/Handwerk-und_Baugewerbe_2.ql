[out:json][timeout:60];


(
  // query
  node(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["opening_hours"!~"."];
  way(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["opening_hours"!~"."];
  relation(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["opening_hours"!~"."];
  // query
  node(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["office"="construction"]
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i];
  way(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["office"="construction"]
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i];
  relation(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["office"="construction"]
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i];
  // query
  node(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["building"="construction"]
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i];
  way(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["building"="construction"]
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i];
  relation(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["building"="construction"]
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i];
);

out body 100;
>;
out skel qt;