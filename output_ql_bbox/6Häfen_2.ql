[out:json][timeout:60];


(

  // query
  node({{bbox}})
    ["railway"="container_terminal"];
  way({{bbox}})
    ["railway"="container_terminal"];
  relation({{bbox}})
    ["railway"="container_terminal"];

  // query
  node({{bbox}})
    ["name"~"Containerterminal|Container Terminal|KV-Terminal|Kombiterminal|Umschlagterminal|Güterterminal|Umschlagplatz|Güterbahnhof|Containerumschlag|Bahnterminal|Logistikterminal|CT-Anlage|Cargo Terminal|Intermodal Terminal", i]
    ["landuse"="railway"];
  way({{bbox}})
    ["name"~"Containerterminal|Container Terminal|KV-Terminal|Kombiterminal|Umschlagterminal|Güterterminal|Umschlagplatz|Güterbahnhof|Containerumschlag|Bahnterminal|Logistikterminal|CT-Anlage|Cargo Terminal|Intermodal Terminal", i]
    ["landuse"="railway"];
  relation({{bbox}})
    ["name"~"Containerterminal|Container Terminal|KV-Terminal|Kombiterminal|Umschlagterminal|Güterterminal|Umschlagplatz|Güterbahnhof|Containerumschlag|Bahnterminal|Logistikterminal|CT-Anlage|Cargo Terminal|Intermodal Terminal", i]
    ["landuse"="railway"];

  // query
  node({{bbox}})
    ["name"~"Containerterminal|Container Terminal|KV-Terminal|Kombiterminal|Umschlagterminal|Güterterminal|Umschlagplatz|Güterbahnhof|Containerumschlag|Bahnterminal|Logistikterminal|CT-Anlage|Cargo Terminal|Intermodal Terminal", i]
    ["railway"="service_station"];
  way({{bbox}})
    ["name"~"Containerterminal|Container Terminal|KV-Terminal|Kombiterminal|Umschlagterminal|Güterterminal|Umschlagplatz|Güterbahnhof|Containerumschlag|Bahnterminal|Logistikterminal|CT-Anlage|Cargo Terminal|Intermodal Terminal", i]
    ["railway"="service_station"];
  relation({{bbox}})
    ["name"~"Containerterminal|Container Terminal|KV-Terminal|Kombiterminal|Umschlagterminal|Güterterminal|Umschlagplatz|Güterbahnhof|Containerumschlag|Bahnterminal|Logistikterminal|CT-Anlage|Cargo Terminal|Intermodal Terminal", i]
    ["railway"="service_station"];

  // query
  node({{bbox}})
    ["name"~"Containerterminal|Container Terminal|KV-Terminal|Kombiterminal|Umschlagterminal|Güterterminal|Umschlagplatz|Güterbahnhof|Containerumschlag|Bahnterminal|Logistikterminal|CT-Anlage|Cargo Terminal|Intermodal Terminal", i]
    ["railway"="platform"]
    ["highway"!~"bus_stop"];
  way({{bbox}})
    ["name"~"Containerterminal|Container Terminal|KV-Terminal|Kombiterminal|Umschlagterminal|Güterterminal|Umschlagplatz|Güterbahnhof|Containerumschlag|Bahnterminal|Logistikterminal|CT-Anlage|Cargo Terminal|Intermodal Terminal", i]
    ["railway"="platform"]
    ["highway"!~"bus_stop"];
  relation({{bbox}})
    ["name"~"Containerterminal|Container Terminal|KV-Terminal|Kombiterminal|Umschlagterminal|Güterterminal|Umschlagplatz|Güterbahnhof|Containerumschlag|Bahnterminal|Logistikterminal|CT-Anlage|Cargo Terminal|Intermodal Terminal", i]
    ["railway"="platform"]
    ["highway"!~"bus_stop"];
);

out body 100;
>;
out skel qt;