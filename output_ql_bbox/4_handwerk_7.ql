[out:json][timeout:60];


(

  // query
  node({{bbox}})
   ["service:vehicle:towing"];
  way({{bbox}})
   ["service:vehicle:towing"];
  relation({{bbox}})
   ["service:vehicle:towing"];

  // query
  node({{bbox}})
    ["shop"~"towing", i];
  way({{bbox}})
    ["shop"~"towing", i];
  relation({{bbox}})
    ["shop"~"towing", i];

  // query
  node({{bbox}})
    ["service:vehicle"~"towing", i];
  way({{bbox}})
    ["service:vehicle"~"towing", i];
  relation({{bbox}})
    ["service:vehicle"~"towing", i];

  // query
  node({{bbox}})
    ["service"~"towing|vehicle_recovery|car_repair", i];
  way({{bbox}})
    ["service"~"towing|vehicle_recovery|car_repair", i];
  relation({{bbox}})
    ["service"~"towing|vehicle_recovery|car_repair", i];

  // query
  node({{bbox}})
    ["name"~"Abschleppdienst|Abschleppservice|Abschleppunternehmen|Abschleppbetrieb|Autoverwertung|Fahrzeugbergung|Fahrzeugrückholung|Pannendienst|Bergungsdienst|Auto Service|Pannenhilfe", i]
    ["shop"!~"car_repair|car_parts", i];
  way({{bbox}})
    ["name"~"Abschleppdienst|Abschleppservice|Abschleppunternehmen|Abschleppbetrieb|Autoverwertung|Fahrzeugbergung|Fahrzeugrückholung|Pannendienst|Bergungsdienst|Auto Service|Pannenhilfe", i]
    ["shop"!~"car_repair|car_parts", i];
  relation({{bbox}})
    ["name"~"Abschleppdienst|Abschleppservice|Abschleppunternehmen|Abschleppbetrieb|Autoverwertung|Fahrzeugbergung|Fahrzeugrückholung|Pannendienst|Bergungsdienst|Auto Service|Pannenhilfe", i]
    ["shop"!~"car_repair|car_parts", i];
);

out body 150;
>;
out skel qt;