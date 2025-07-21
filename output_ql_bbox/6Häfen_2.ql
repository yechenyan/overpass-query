[out:json][timeout:60];


(

  // query
  node({{bbox}})
    ["name"~"Containerterminal|Container Terminal|KV-Terminal|Kombiterminal|Umschlagterminal|Güterterminal|Umschlagplatz|Güterbahnhof|Containerumschlag|Bahnterminal|Logistikterminal|CT-Anlage|Cargo Terminal|Intermodal Terminal", i]
    ["highway"!~"."];
  way({{bbox}})
    ["name"~"Containerterminal|Container Terminal|KV-Terminal|Kombiterminal|Umschlagterminal|Güterterminal|Umschlagplatz|Güterbahnhof|Containerumschlag|Bahnterminal|Logistikterminal|CT-Anlage|Cargo Terminal|Intermodal Terminal", i]
    ["highway"!~"."];
  relation({{bbox}})
    ["name"~"Containerterminal|Container Terminal|KV-Terminal|Kombiterminal|Umschlagterminal|Güterterminal|Umschlagplatz|Güterbahnhof|Containerumschlag|Bahnterminal|Logistikterminal|CT-Anlage|Cargo Terminal|Intermodal Terminal", i]
    ["highway"!~"."];
);

out body 150;
>;
out skel qt;