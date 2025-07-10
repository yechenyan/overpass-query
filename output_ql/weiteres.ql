[out:json][timeout:60];


(
  // query
  node(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["name"~"Zalando|Fiege|Rhenus|Amazon|DHL|Hermes|UPS|GLS|DPD"]
    ["opening_hours"!~"."];
  way(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["name"~"Zalando|Fiege|Rhenus|Amazon|DHL|Hermes|UPS|GLS|DPD"]
    ["opening_hours"!~"."];
  relation(52.428698929952496,13.719520568847658,52.52457705042609,13.943023681640627)
    ["name"~"Zalando|Fiege|Rhenus|Amazon|DHL|Hermes|UPS|GLS|DPD"]
    ["opening_hours"!~"."];
);

out body 100;
>;
out skel qt;