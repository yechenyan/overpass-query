[out:json][timeout:60];


(
  // query
  node(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["name"~"Umzüge|Strabag|Züblin|Max Bögl|Hochtief|Bilfinger|Leonhard Weiss|WOLFF&MÜLLER|Implenia|Goldbeck", i]
    ["opening_hours"!~"."];
  way(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["name"~"Umzüge|Strabag|Züblin|Max Bögl|Hochtief|Bilfinger|Leonhard Weiss|WOLFF&MÜLLER|Implenia|Goldbeck", i]
    ["opening_hours"!~"."];
  relation(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["name"~"Umzüge|Strabag|Züblin|Max Bögl|Hochtief|Bilfinger|Leonhard Weiss|WOLFF&MÜLLER|Implenia|Goldbeck", i]
    ["opening_hours"!~"."];
  // query
  node(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["building"="construction"]
    ["name"~"Umzüge|Strabag|Züblin|Max Bögl|Hochtief|Bilfinger|Leonhard Weiss|WOLFF&MÜLLER|Implenia|Goldbeck", i];
  way(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["building"="construction"]
    ["name"~"Umzüge|Strabag|Züblin|Max Bögl|Hochtief|Bilfinger|Leonhard Weiss|WOLFF&MÜLLER|Implenia|Goldbeck", i];
  relation(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["building"="construction"]
    ["name"~"Umzüge|Strabag|Züblin|Max Bögl|Hochtief|Bilfinger|Leonhard Weiss|WOLFF&MÜLLER|Implenia|Goldbeck", i];
);

out body 100;
>;
out skel qt;