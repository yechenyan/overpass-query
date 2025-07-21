[out:json][timeout:60];


(

  // query
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["amenity"~"fire_station|ambulance_station|disaster_response|police|emergency", i];
);

out body 150;
>;
out skel qt;