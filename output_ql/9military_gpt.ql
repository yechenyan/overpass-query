[out:json][timeout:60];


(

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["landuse"="military"]
    ["amenity"!~"hospital"]
    ["man_made"!~"surveillance"]
    ["military"!~"radar_facility|danger_area|obstacle_course"]
    ["aeroway"!~"heliport"]
   [!"was:operator"][!"abandoned:aeroway"][!"hospital"][!"abandoned"][!"disused"][!"historic"][!"memorial"][!"was:military"][!"military:past"][!"building:use"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["landuse"="military"]
    ["amenity"!~"hospital"]
    ["man_made"!~"surveillance"]
    ["military"!~"radar_facility|danger_area|obstacle_course"]
    ["aeroway"!~"heliport"]
   [!"was:operator"][!"abandoned:aeroway"][!"hospital"][!"abandoned"][!"disused"][!"historic"][!"memorial"][!"was:military"][!"military:past"][!"building:use"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["landuse"="military"]
    ["amenity"!~"hospital"]
    ["man_made"!~"surveillance"]
    ["military"!~"radar_facility|danger_area|obstacle_course"]
    ["aeroway"!~"heliport"]
   [!"was:operator"][!"abandoned:aeroway"][!"hospital"][!"abandoned"][!"disused"][!"historic"][!"memorial"][!"was:military"][!"military:past"][!"building:use"];

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["military"~"barracks|base|depot|airfield|training_area"]
    ["amenity"!~"hospital"]
    ["man_made"!~"surveillance"]
   [!"was:operator"][!"abandoned:aeroway"][!"hospital"][!"abandoned"][!"disused"][!"historic"][!"memorial"][!"was:military"][!"military:past"][!"building:use"];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["military"~"barracks|base|depot|airfield|training_area"]
    ["amenity"!~"hospital"]
    ["man_made"!~"surveillance"]
   [!"was:operator"][!"abandoned:aeroway"][!"hospital"][!"abandoned"][!"disused"][!"historic"][!"memorial"][!"was:military"][!"military:past"][!"building:use"];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["military"~"barracks|base|depot|airfield|training_area"]
    ["amenity"!~"hospital"]
    ["man_made"!~"surveillance"]
   [!"was:operator"][!"abandoned:aeroway"][!"hospital"][!"abandoned"][!"disused"][!"historic"][!"memorial"][!"was:military"][!"military:past"][!"building:use"];
);

out body 150;
>;
out skel qt;