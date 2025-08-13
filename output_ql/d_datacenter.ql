[out:json][timeout:60];


(

  // query
  node(area:3600051477)
    ["name"~"data[ _]?center|datacenter|Rechenzentrum", i];
  way(area:3600051477)
    ["name"~"data[ _]?center|datacenter|Rechenzentrum", i];
  relation(area:3600051477)
    ["name"~"data[ _]?center|datacenter|Rechenzentrum", i];
);

out body 150;
>;
out skel qt;