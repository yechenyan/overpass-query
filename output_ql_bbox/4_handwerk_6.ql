[out:json][timeout:60];


(

  // query
  node({{bbox}})
    ["name"~"Maler|Lackierer|Stuckateur|Fliesen|Fliesenleger|Bodenleger|Trockenbau|Fassaden", i]
    ["craft"~"."];
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