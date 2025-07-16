[out:json][timeout:60];


(

  // query
  node(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["amenity"!~"restaurant|fast_food|kindergarten|pub|bar|community_centre|arts_centre|nightclub|childcare|bank|cafe|university|research_institute"]
    ["office"!~"estate_agent|government|architect|association|company|political_party|educational_institution"]
    ["historic"!~"."]
    ["tourism"!~"."]
    ["railway"!~"."]
    ["highway"!~"."]
    ["man_made"!~"tree_grate|monitoring_station"]
    ["toilets"!~"."]
    ["waterway"!~"."]
    ["healthcare"!~"."]
    ["natural"!~"."]
    ["place"!~"hamlet|suburb"]
    ["public_transport"!~"."]
    ["leisure"!~"miniature_golf"]
    ["craft"!~"."]
    ["shop"!~"."];
  way(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["amenity"!~"restaurant|fast_food|kindergarten|pub|bar|community_centre|arts_centre|nightclub|childcare|bank|cafe|university|research_institute"]
    ["office"!~"estate_agent|government|architect|association|company|political_party|educational_institution"]
    ["historic"!~"."]
    ["tourism"!~"."]
    ["railway"!~"."]
    ["highway"!~"."]
    ["man_made"!~"tree_grate|monitoring_station"]
    ["toilets"!~"."]
    ["waterway"!~"."]
    ["healthcare"!~"."]
    ["natural"!~"."]
    ["place"!~"hamlet|suburb"]
    ["public_transport"!~"."]
    ["leisure"!~"miniature_golf"]
    ["craft"!~"."]
    ["shop"!~"."];
  relation(52.344149, 12.967987, 52.727144, 13.862)
    ["name"~"Bau|Baufirma|Bauunternehmen|Hochbau|Tiefbau|Straßenbau|Kanalbau|Rohbau|Ausbau|Maurer|Beton|Estrich", i]
    ["amenity"!~"restaurant|fast_food|kindergarten|pub|bar|community_centre|arts_centre|nightclub|childcare|bank|cafe|university|research_institute"]
    ["office"!~"estate_agent|government|architect|association|company|political_party|educational_institution"]
    ["historic"!~"."]
    ["tourism"!~"."]
    ["railway"!~"."]
    ["highway"!~"."]
    ["man_made"!~"tree_grate|monitoring_station"]
    ["toilets"!~"."]
    ["waterway"!~"."]
    ["healthcare"!~"."]
    ["natural"!~"."]
    ["place"!~"hamlet|suburb"]
    ["public_transport"!~"."]
    ["leisure"!~"miniature_golf"]
    ["craft"!~"."]
    ["shop"!~"."];
);

out body 100;
>;
out skel qt;