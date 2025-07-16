[out:json][timeout:60];


(

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["railway"="container_terminal"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["railway"="container_terminal"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["railway"="container_terminal"];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Containerterminal|Container Terminal|KV-Terminal|Kombiterminal|Umschlagterminal|Güterterminal|Umschlagplatz|Güterbahnhof|Containerumschlag|Bahnterminal|Logistikterminal|CT-Anlage|Cargo Terminal|Intermodal Terminal", i]
    ["landuse"="railway"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Containerterminal|Container Terminal|KV-Terminal|Kombiterminal|Umschlagterminal|Güterterminal|Umschlagplatz|Güterbahnhof|Containerumschlag|Bahnterminal|Logistikterminal|CT-Anlage|Cargo Terminal|Intermodal Terminal", i]
    ["landuse"="railway"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Containerterminal|Container Terminal|KV-Terminal|Kombiterminal|Umschlagterminal|Güterterminal|Umschlagplatz|Güterbahnhof|Containerumschlag|Bahnterminal|Logistikterminal|CT-Anlage|Cargo Terminal|Intermodal Terminal", i]
    ["landuse"="railway"];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Containerterminal|Container Terminal|KV-Terminal|Kombiterminal|Umschlagterminal|Güterterminal|Umschlagplatz|Güterbahnhof|Containerumschlag|Bahnterminal|Logistikterminal|CT-Anlage|Cargo Terminal|Intermodal Terminal", i]
    ["railway"="service_station"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Containerterminal|Container Terminal|KV-Terminal|Kombiterminal|Umschlagterminal|Güterterminal|Umschlagplatz|Güterbahnhof|Containerumschlag|Bahnterminal|Logistikterminal|CT-Anlage|Cargo Terminal|Intermodal Terminal", i]
    ["railway"="service_station"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Containerterminal|Container Terminal|KV-Terminal|Kombiterminal|Umschlagterminal|Güterterminal|Umschlagplatz|Güterbahnhof|Containerumschlag|Bahnterminal|Logistikterminal|CT-Anlage|Cargo Terminal|Intermodal Terminal", i]
    ["railway"="service_station"];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Containerterminal|Container Terminal|KV-Terminal|Kombiterminal|Umschlagterminal|Güterterminal|Umschlagplatz|Güterbahnhof|Containerumschlag|Bahnterminal|Logistikterminal|CT-Anlage|Cargo Terminal|Intermodal Terminal", i]
    ["railway"="platform"]
    ["highway"!~"bus_stop"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Containerterminal|Container Terminal|KV-Terminal|Kombiterminal|Umschlagterminal|Güterterminal|Umschlagplatz|Güterbahnhof|Containerumschlag|Bahnterminal|Logistikterminal|CT-Anlage|Cargo Terminal|Intermodal Terminal", i]
    ["railway"="platform"]
    ["highway"!~"bus_stop"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Containerterminal|Container Terminal|KV-Terminal|Kombiterminal|Umschlagterminal|Güterterminal|Umschlagplatz|Güterbahnhof|Containerumschlag|Bahnterminal|Logistikterminal|CT-Anlage|Cargo Terminal|Intermodal Terminal", i]
    ["railway"="platform"]
    ["highway"!~"bus_stop"];
);

out body 100;
>;
out skel qt;