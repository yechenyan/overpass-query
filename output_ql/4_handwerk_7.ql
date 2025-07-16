[out:json][timeout:60];


(

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["shop"~"towing", i];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["shop"~"towing", i];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["shop"~"towing", i];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["service"~"towing|vehicle_recovery|car_repair", i];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["service"~"towing|vehicle_recovery|car_repair", i];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["service"~"towing|vehicle_recovery|car_repair", i];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Abschleppdienst|Abschleppservice|Abschleppunternehmen|Abschleppbetrieb|Autoverwertung|Fahrzeugbergung|Fahrzeugrückholung|Pannendienst|Bergungsdienst|Auto Service|ADAC|ACE|Pannenhilfe", i]
    ["shop"~"car_part"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Abschleppdienst|Abschleppservice|Abschleppunternehmen|Abschleppbetrieb|Autoverwertung|Fahrzeugbergung|Fahrzeugrückholung|Pannendienst|Bergungsdienst|Auto Service|ADAC|ACE|Pannenhilfe", i]
    ["shop"~"car_part"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Abschleppdienst|Abschleppservice|Abschleppunternehmen|Abschleppbetrieb|Autoverwertung|Fahrzeugbergung|Fahrzeugrückholung|Pannendienst|Bergungsdienst|Auto Service|ADAC|ACE|Pannenhilfe", i]
    ["shop"~"car_part"];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Abschleppdienst|Abschleppservice|Abschleppunternehmen|Abschleppbetrieb|Autoverwertung|Fahrzeugbergung|Fahrzeugrückholung|Pannendienst|Bergungsdienst|Auto Service|ADAC|ACE|Pannenhilfe"]
    ["brand"~"Abschleppdienst|Abschleppservice|Abschleppunternehmen|Abschleppbetrieb|Autoverwertung|Fahrzeugbergung|Fahrzeugrückholung|Pannendienst|Bergungsdienst|Auto Service|ADAC|ACE|Pannenhilfe", i]
    ["shop"!~"travel_agency"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Abschleppdienst|Abschleppservice|Abschleppunternehmen|Abschleppbetrieb|Autoverwertung|Fahrzeugbergung|Fahrzeugrückholung|Pannendienst|Bergungsdienst|Auto Service|ADAC|ACE|Pannenhilfe"]
    ["brand"~"Abschleppdienst|Abschleppservice|Abschleppunternehmen|Abschleppbetrieb|Autoverwertung|Fahrzeugbergung|Fahrzeugrückholung|Pannendienst|Bergungsdienst|Auto Service|ADAC|ACE|Pannenhilfe", i]
    ["shop"!~"travel_agency"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Abschleppdienst|Abschleppservice|Abschleppunternehmen|Abschleppbetrieb|Autoverwertung|Fahrzeugbergung|Fahrzeugrückholung|Pannendienst|Bergungsdienst|Auto Service|ADAC|ACE|Pannenhilfe"]
    ["brand"~"Abschleppdienst|Abschleppservice|Abschleppunternehmen|Abschleppbetrieb|Autoverwertung|Fahrzeugbergung|Fahrzeugrückholung|Pannendienst|Bergungsdienst|Auto Service|ADAC|ACE|Pannenhilfe", i]
    ["shop"!~"travel_agency"];
);

out body 100;
>;
out skel qt;