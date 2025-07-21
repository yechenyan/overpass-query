[out:json][timeout:60];


(

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
   ["service:vehicle:towing"];
  way(52.344149, 12.967987, 52.727144, 13.862)
   ["service:vehicle:towing"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
   ["service:vehicle:towing"];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["shop"~"towing", i];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["shop"~"towing", i];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["shop"~"towing", i];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["service:vehicle"~"towing", i];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["service:vehicle"~"towing", i];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["service:vehicle"~"towing", i];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["service"~"towing|vehicle_recovery|car_repair", i];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["service"~"towing|vehicle_recovery|car_repair", i];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["service"~"towing|vehicle_recovery|car_repair", i];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Abschleppdienst|Abschleppservice|Abschleppunternehmen|Abschleppbetrieb|Autoverwertung|Fahrzeugbergung|Fahrzeugrückholung|Pannendienst|Bergungsdienst|Auto Service|Pannenhilfe", i]
    ["shop"!~"car_repair|car_parts", i];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Abschleppdienst|Abschleppservice|Abschleppunternehmen|Abschleppbetrieb|Autoverwertung|Fahrzeugbergung|Fahrzeugrückholung|Pannendienst|Bergungsdienst|Auto Service|Pannenhilfe", i]
    ["shop"!~"car_repair|car_parts", i];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Abschleppdienst|Abschleppservice|Abschleppunternehmen|Abschleppbetrieb|Autoverwertung|Fahrzeugbergung|Fahrzeugrückholung|Pannendienst|Bergungsdienst|Auto Service|Pannenhilfe", i]
    ["shop"!~"car_repair|car_parts", i];
);

out body 150;
>;
out skel qt;