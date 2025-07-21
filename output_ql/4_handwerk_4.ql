[out:json][timeout:60];


(

  // query
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"roofing|carpentry|joiner|woodworking|interior|zimmerer|tischler|schreiner|holzbau|Zimmerei", i]
    ["craft"~"."];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"roofing|carpentry|joiner|woodworking|interior|zimmerer|tischler|schreiner|holzbau|Zimmerei", i]
    ["craft"~"."];
);

out body 100;
>;
out skel qt;