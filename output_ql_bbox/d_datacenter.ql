[out:json][timeout:60];


(

  // query
  node({{bbox}})
    ["name"~"data[ _]?center|datacenter|Rechenzentrum", i];
  way({{bbox}})
    ["name"~"data[ _]?center|datacenter|Rechenzentrum", i];
  relation({{bbox}})
    ["name"~"data[ _]?center|datacenter|Rechenzentrum", i];
);

out body 150;
>;
out skel qt;