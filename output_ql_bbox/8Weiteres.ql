[out:json][timeout:60];


(

  // query
  node({{bbox}})
    ["name"~"Zalando|Amazon|Fiege|Rhenus", i]
    ["building"~"warehouse|logistics|commercial", i];
  way({{bbox}})
    ["name"~"Zalando|Amazon|Fiege|Rhenus", i]
    ["building"~"warehouse|logistics|commercial", i];
  relation({{bbox}})
    ["name"~"Zalando|Amazon|Fiege|Rhenus", i]
    ["building"~"warehouse|logistics|commercial", i];

  // query
  node({{bbox}})
    ["name"~"Zalando|Amazon|Fiege|Rhenus", i]
    ["landuse"~"industrial|commercial", i];
  way({{bbox}})
    ["name"~"Zalando|Amazon|Fiege|Rhenus", i]
    ["landuse"~"industrial|commercial", i];
  relation({{bbox}})
    ["name"~"Zalando|Amazon|Fiege|Rhenus", i]
    ["landuse"~"industrial|commercial", i];

  // query
  node({{bbox}})
    ["operator"~"Zalando|Amazon|Fiege|Rhenus", i]
    ["building"~"warehouse|logistics|commercial", i];
  way({{bbox}})
    ["operator"~"Zalando|Amazon|Fiege|Rhenus", i]
    ["building"~"warehouse|logistics|commercial", i];
  relation({{bbox}})
    ["operator"~"Zalando|Amazon|Fiege|Rhenus", i]
    ["building"~"warehouse|logistics|commercial", i];

  // query
  node({{bbox}})
    ["operator"~"Zalando|Amazon|Fiege|Rhenus", i]
    ["landuse"~"industrial|commercial", i];
  way({{bbox}})
    ["operator"~"Zalando|Amazon|Fiege|Rhenus", i]
    ["landuse"~"industrial|commercial", i];
  relation({{bbox}})
    ["operator"~"Zalando|Amazon|Fiege|Rhenus", i]
    ["landuse"~"industrial|commercial", i];

  // query
  node({{bbox}})
    ["name"~"Zalando|Amazon|Fiege|Rhenus", i]
    ["amenity"="post_depot"];
  way({{bbox}})
    ["name"~"Zalando|Amazon|Fiege|Rhenus", i]
    ["amenity"="post_depot"];
  relation({{bbox}})
    ["name"~"Zalando|Amazon|Fiege|Rhenus", i]
    ["amenity"="post_depot"];
);

out body 100;
>;
out skel qt;