[out:json][timeout:60];


(

  // query
  node({{bbox}})
    ["name"~"roofing|carpentry|joiner|woodworking|interior|zimmerer|tischler|schreiner|holzbau", i]
    ["craft"~"."];
  way({{bbox}})
    ["name"~"roofing|carpentry|joiner|woodworking|interior|zimmerer|tischler|schreiner|holzbau", i]
    ["craft"~"."];
  relation({{bbox}})
    ["name"~"roofing|carpentry|joiner|woodworking|interior|zimmerer|tischler|schreiner|holzbau", i]
    ["craft"~"."];
);

out body 100;
>;
out skel qt;