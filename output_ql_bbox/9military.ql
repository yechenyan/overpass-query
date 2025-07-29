[out:json][timeout:60];


(

  // query
  node({{bbox}})
    ["landuse"="military"]
    ["office"!~"government"]
    ["amenity"!~"hospital"]
    ["name"!~"Militärgeschichte"]
    ["man_made"!~"surveillance"]
    ["military"!~"radar_facility|danger_area|obstacle_course"]
    ["aeroway"!~"heliport"]
   [!"was:operator"][!"abandoned:aeroway"][!"hospital"][!"abandoned"][!"disused"][!"historic"][!"memorial"][!"was:military"][!"military:past"][!"building:use"];
  way({{bbox}})
    ["landuse"="military"]
    ["office"!~"government"]
    ["amenity"!~"hospital"]
    ["name"!~"Militärgeschichte"]
    ["man_made"!~"surveillance"]
    ["military"!~"radar_facility|danger_area|obstacle_course"]
    ["aeroway"!~"heliport"]
   [!"was:operator"][!"abandoned:aeroway"][!"hospital"][!"abandoned"][!"disused"][!"historic"][!"memorial"][!"was:military"][!"military:past"][!"building:use"];
  relation({{bbox}})
    ["landuse"="military"]
    ["office"!~"government"]
    ["amenity"!~"hospital"]
    ["name"!~"Militärgeschichte"]
    ["man_made"!~"surveillance"]
    ["military"!~"radar_facility|danger_area|obstacle_course"]
    ["aeroway"!~"heliport"]
   [!"was:operator"][!"abandoned:aeroway"][!"hospital"][!"abandoned"][!"disused"][!"historic"][!"memorial"][!"was:military"][!"military:past"][!"building:use"];

  // query
  node({{bbox}})
    ["military"~"barracks|base|depot|airfield|training_area"]
    ["amenity"!~"hospital"]
    ["office"!~"government"]
    ["name"!~"Militärgeschichte"]
    ["man_made"!~"surveillance"]
   [!"was:operator"][!"abandoned:aeroway"][!"hospital"][!"abandoned"][!"disused"][!"historic"][!"memorial"][!"was:military"][!"military:past"][!"building:use"];
  way({{bbox}})
    ["military"~"barracks|base|depot|airfield|training_area"]
    ["amenity"!~"hospital"]
    ["office"!~"government"]
    ["name"!~"Militärgeschichte"]
    ["man_made"!~"surveillance"]
   [!"was:operator"][!"abandoned:aeroway"][!"hospital"][!"abandoned"][!"disused"][!"historic"][!"memorial"][!"was:military"][!"military:past"][!"building:use"];
  relation({{bbox}})
    ["military"~"barracks|base|depot|airfield|training_area"]
    ["amenity"!~"hospital"]
    ["office"!~"government"]
    ["name"!~"Militärgeschichte"]
    ["man_made"!~"surveillance"]
   [!"was:operator"][!"abandoned:aeroway"][!"hospital"][!"abandoned"][!"disused"][!"historic"][!"memorial"][!"was:military"][!"military:past"][!"building:use"];
);

out body 150;
>;
out skel qt;