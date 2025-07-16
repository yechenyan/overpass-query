[out:json][timeout:60];


(

  // query
  node({{bbox}})
    ["shop"~"towing", i];
  way({{bbox}})
    ["shop"~"towing", i];
  relation({{bbox}})
    ["shop"~"towing", i];

  // query
  node({{bbox}})
    ["service"~"towing|vehicle_recovery|car_repair", i];
  way({{bbox}})
    ["service"~"towing|vehicle_recovery|car_repair", i];
  relation({{bbox}})
    ["service"~"towing|vehicle_recovery|car_repair", i];

  // query
  node({{bbox}})
    ["name"~"Abschleppdienst|Abschleppservice|Abschleppunternehmen|Abschleppbetrieb|Autoverwertung|Fahrzeugbergung|Fahrzeugrückholung|Pannendienst|Bergungsdienst|Auto Service|ADAC|ACE|Pannenhilfe", i]
    ["shop"~"car_part"];
  way({{bbox}})
    ["name"~"Abschleppdienst|Abschleppservice|Abschleppunternehmen|Abschleppbetrieb|Autoverwertung|Fahrzeugbergung|Fahrzeugrückholung|Pannendienst|Bergungsdienst|Auto Service|ADAC|ACE|Pannenhilfe", i]
    ["shop"~"car_part"];
  relation({{bbox}})
    ["name"~"Abschleppdienst|Abschleppservice|Abschleppunternehmen|Abschleppbetrieb|Autoverwertung|Fahrzeugbergung|Fahrzeugrückholung|Pannendienst|Bergungsdienst|Auto Service|ADAC|ACE|Pannenhilfe", i]
    ["shop"~"car_part"];

  // query
  node({{bbox}})
    ["name"~"Abschleppdienst|Abschleppservice|Abschleppunternehmen|Abschleppbetrieb|Autoverwertung|Fahrzeugbergung|Fahrzeugrückholung|Pannendienst|Bergungsdienst|Auto Service|ADAC|ACE|Pannenhilfe"]
    ["brand"~"Abschleppdienst|Abschleppservice|Abschleppunternehmen|Abschleppbetrieb|Autoverwertung|Fahrzeugbergung|Fahrzeugrückholung|Pannendienst|Bergungsdienst|Auto Service|ADAC|ACE|Pannenhilfe", i]
    ["shop"!~"travel_agency"];
  way({{bbox}})
    ["name"~"Abschleppdienst|Abschleppservice|Abschleppunternehmen|Abschleppbetrieb|Autoverwertung|Fahrzeugbergung|Fahrzeugrückholung|Pannendienst|Bergungsdienst|Auto Service|ADAC|ACE|Pannenhilfe"]
    ["brand"~"Abschleppdienst|Abschleppservice|Abschleppunternehmen|Abschleppbetrieb|Autoverwertung|Fahrzeugbergung|Fahrzeugrückholung|Pannendienst|Bergungsdienst|Auto Service|ADAC|ACE|Pannenhilfe", i]
    ["shop"!~"travel_agency"];
  relation({{bbox}})
    ["name"~"Abschleppdienst|Abschleppservice|Abschleppunternehmen|Abschleppbetrieb|Autoverwertung|Fahrzeugbergung|Fahrzeugrückholung|Pannendienst|Bergungsdienst|Auto Service|ADAC|ACE|Pannenhilfe"]
    ["brand"~"Abschleppdienst|Abschleppservice|Abschleppunternehmen|Abschleppbetrieb|Autoverwertung|Fahrzeugbergung|Fahrzeugrückholung|Pannendienst|Bergungsdienst|Auto Service|ADAC|ACE|Pannenhilfe", i]
    ["shop"!~"travel_agency"];
);

out body 100;
>;
out skel qt;