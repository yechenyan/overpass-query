[out:json][timeout:60];


(

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Zalando|Amazon|Fiege|Rhenus", i]
    ["building"~"warehouse|logistics|commercial", i];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Zalando|Amazon|Fiege|Rhenus", i]
    ["building"~"warehouse|logistics|commercial", i];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Zalando|Amazon|Fiege|Rhenus", i]
    ["building"~"warehouse|logistics|commercial", i];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Zalando|Amazon|Fiege|Rhenus", i]
    ["landuse"~"industrial|commercial", i];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Zalando|Amazon|Fiege|Rhenus", i]
    ["landuse"~"industrial|commercial", i];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Zalando|Amazon|Fiege|Rhenus", i]
    ["landuse"~"industrial|commercial", i];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["operator"~"Zalando|Amazon|Fiege|Rhenus", i]
    ["building"~"warehouse|logistics|commercial", i];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["operator"~"Zalando|Amazon|Fiege|Rhenus", i]
    ["building"~"warehouse|logistics|commercial", i];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["operator"~"Zalando|Amazon|Fiege|Rhenus", i]
    ["building"~"warehouse|logistics|commercial", i];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["operator"~"Zalando|Amazon|Fiege|Rhenus", i]
    ["landuse"~"industrial|commercial", i];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["operator"~"Zalando|Amazon|Fiege|Rhenus", i]
    ["landuse"~"industrial|commercial", i];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["operator"~"Zalando|Amazon|Fiege|Rhenus", i]
    ["landuse"~"industrial|commercial", i];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Zalando|Amazon|Fiege|Rhenus", i]
    ["amenity"="post_depot"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Zalando|Amazon|Fiege|Rhenus", i]
    ["amenity"="post_depot"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Zalando|Amazon|Fiege|Rhenus", i]
    ["amenity"="post_depot"];
);

out body 100;
>;
out skel qt;