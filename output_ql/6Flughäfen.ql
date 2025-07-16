[out:json][timeout:60];


(

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["aeroway"="aerodrome"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["aeroway"="aerodrome"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["aeroway"="aerodrome"];
);

out body 100;
>;
out skel qt;