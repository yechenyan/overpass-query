[out:json][timeout:60];


(

  // query
  way({{bbox}})
    ["amenity"~"fire_station|ambulance_station|disaster_response|emergency", i];
  relation({{bbox}})
    ["amenity"~"fire_station|ambulance_station|disaster_response|emergency", i];

  // query
  way({{bbox}})
    ["name"~"Feuerwehr|Freiwillige Feuerwehr|Berufsfeuerwehr|Werkfeuerwehr|Feuerwehrhaus|Feuerwehrwache|Feuerwache|Löschzug|Rettungswache|Rettungsdienst|Katastrophenschutz|Technisches Hilfswerk|THW|DRK|ASB|Malteser|Johanniter"]
    ["building"~"."]
    ["name"!~"Bege|Tagespflege"]
    ["building"!~"apartments|commercial"]
    ["amenity"!~"community_centre"];
  relation({{bbox}})
    ["name"~"Feuerwehr|Freiwillige Feuerwehr|Berufsfeuerwehr|Werkfeuerwehr|Feuerwehrhaus|Feuerwehrwache|Feuerwache|Löschzug|Rettungswache|Rettungsdienst|Katastrophenschutz|Technisches Hilfswerk|THW|DRK|ASB|Malteser|Johanniter"]
    ["building"~"."]
    ["name"!~"Bege|Tagespflege"]
    ["building"!~"apartments|commercial"]
    ["amenity"!~"community_centre"];
);

out body 150;
>;
out skel qt;