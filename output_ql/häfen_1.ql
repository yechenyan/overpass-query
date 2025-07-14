[out:json][timeout:60];


(
  // query
  node(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["name"~"Hafen|Binnenhafen|Seehafen|Industriehafen|Güterhafen|Umschlaghafen|Hafenanlage|Hafenbecken|Kai|Hafenbetrieb|Hafenlogistik|Hafenumschlag|Hafenverwaltung", i]
    ["opening_hours"!~"."];
  way(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["name"~"Hafen|Binnenhafen|Seehafen|Industriehafen|Güterhafen|Umschlaghafen|Hafenanlage|Hafenbecken|Kai|Hafenbetrieb|Hafenlogistik|Hafenumschlag|Hafenverwaltung", i]
    ["opening_hours"!~"."];
  relation(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["name"~"Hafen|Binnenhafen|Seehafen|Industriehafen|Güterhafen|Umschlaghafen|Hafenanlage|Hafenbecken|Kai|Hafenbetrieb|Hafenlogistik|Hafenumschlag|Hafenverwaltung", i]
    ["opening_hours"!~"."];
  // query
  node(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["landuse"~"port", i];
  way(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["landuse"~"port", i];
  relation(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["landuse"~"port", i];
  // query
  node(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["man_made"~"pier", i];
  way(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["man_made"~"pier", i];
  relation(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["man_made"~"pier", i];
  // query
  node(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["waterway"~"dock|harbour", i];
  way(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["waterway"~"dock|harbour", i];
  relation(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["waterway"~"dock|harbour", i];
  // query
  node(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["seamark:type"~"harbour", i];
  way(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["seamark:type"~"harbour", i];
  relation(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["seamark:type"~"harbour", i];
  // query
  node(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["industrial"~"quay", i];
  way(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["industrial"~"quay", i];
  relation(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["industrial"~"quay", i];
);

out body 100;
>;
out skel qt;