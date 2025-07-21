[out:json][timeout:60];


(

  // query
  way({{bbox}})
    ["name"~"Maler|Lackierer|Stuckateur|Fliesen|Fliesenleger|Bodenleger|Trockenbau|Fassaden", i]
    ["craft"~"."];
  relation({{bbox}})
    ["name"~"Maler|Lackierer|Stuckateur|Fliesen|Fliesenleger|Bodenleger|Trockenbau|Fassaden", i]
    ["craft"~"."];
);

out body 100;
>;
out skel qt;