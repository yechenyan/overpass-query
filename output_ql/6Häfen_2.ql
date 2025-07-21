[out:json][timeout:60];


(

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Containerterminal|Container Terminal|KV-Terminal|Kombiterminal|Umschlagterminal|Güterterminal|Umschlagplatz|Güterbahnhof|Containerumschlag|Bahnterminal|Logistikterminal|CT-Anlage|Cargo Terminal|Intermodal Terminal", i]
    ["highway"!~"."];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Containerterminal|Container Terminal|KV-Terminal|Kombiterminal|Umschlagterminal|Güterterminal|Umschlagplatz|Güterbahnhof|Containerumschlag|Bahnterminal|Logistikterminal|CT-Anlage|Cargo Terminal|Intermodal Terminal", i]
    ["highway"!~"."];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Containerterminal|Container Terminal|KV-Terminal|Kombiterminal|Umschlagterminal|Güterterminal|Umschlagplatz|Güterbahnhof|Containerumschlag|Bahnterminal|Logistikterminal|CT-Anlage|Cargo Terminal|Intermodal Terminal", i]
    ["highway"!~"."];
);

out body 150;
>;
out skel qt;