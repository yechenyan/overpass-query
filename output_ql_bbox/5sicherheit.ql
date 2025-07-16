[out:json][timeout:60];


(

  // query
  node({{bbox}})
    ["amenity"~"fire_station|ambulance_station|disaster_response|police|emergency", i];
  way({{bbox}})
    ["amenity"~"fire_station|ambulance_station|disaster_response|police|emergency", i];
  relation({{bbox}})
    ["amenity"~"fire_station|ambulance_station|disaster_response|police|emergency", i];
);

out body 100;
>;
out skel qt;