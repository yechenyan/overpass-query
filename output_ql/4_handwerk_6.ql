[out:json][timeout:60];


(

  // query
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Maler|Lackierer|Stuckateur|Fliesen|Fliesenleger|Bodenleger|Trockenbau|Fassaden", i]
    ["craft"~"."];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Maler|Lackierer|Stuckateur|Fliesen|Fliesenleger|Bodenleger|Trockenbau|Fassaden", i]
    ["craft"~"."];
);

out body 100;
>;
out skel qt;