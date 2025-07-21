[out:json][timeout:60];


(

  // query
  way({{bbox}})
    ["amenity"~"fire_station|ambulance_station|disaster_response|police|emergency", i];
);

out body 150;
>;
out skel qt;