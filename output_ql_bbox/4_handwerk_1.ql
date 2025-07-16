[out:json][timeout:60];


(

  // query
  node({{bbox}})
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
  way({{bbox}})
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
  relation({{bbox}})
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