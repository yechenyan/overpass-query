[out:json][timeout:60];


(

  // query
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["amenity"~"fire_station|ambulance_station|disaster_response|emergency", i];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["amenity"~"fire_station|ambulance_station|disaster_response|emergency", i];

  // query
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Feuerwehr|Freiwillige Feuerwehr|Berufsfeuerwehr|Werkfeuerwehr|Feuerwehrhaus|Feuerwehrwache|Feuerwache|Löschzug|Rettungswache|Rettungsdienst|Katastrophenschutz|Technisches Hilfswerk|THW|DRK|ASB|Malteser|Johanniter"]
    ["building"~"."]
    ["name"!~"Bege|Tagespflege"]
    ["building"!~"apartments|commercial"]
    ["amenity"!~"community_centre"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Feuerwehr|Freiwillige Feuerwehr|Berufsfeuerwehr|Werkfeuerwehr|Feuerwehrhaus|Feuerwehrwache|Feuerwache|Löschzug|Rettungswache|Rettungsdienst|Katastrophenschutz|Technisches Hilfswerk|THW|DRK|ASB|Malteser|Johanniter"]
    ["building"~"."]
    ["name"!~"Bege|Tagespflege"]
    ["building"!~"apartments|commercial"]
    ["amenity"!~"community_centre"];
);

out body 150;
>;
out skel qt;