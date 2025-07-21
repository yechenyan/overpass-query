[out:json][timeout:60];


(

  // query
  way({{bbox}})
    ["name"~"roofing|carpentry|joiner|woodworking|interior|zimmerer|tischler|schreiner|holzbau|Zimmerei", i]
    ["craft"~"."];
  relation({{bbox}})
    ["name"~"roofing|carpentry|joiner|woodworking|interior|zimmerer|tischler|schreiner|holzbau|Zimmerei", i]
    ["craft"~"."];
);

out body 100;
>;
out skel qt;