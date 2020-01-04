# Mapping with Leaflet.js and Leaflet Draw

Simplifying what I know on this subject.

https://mapping-with-leaflet.herokuapp.com

...and now we build.

This app has user authenication with Devise, and mapping with leaflet.js and drawing shapes with Leaflet Draw. 
I figured out a clever way to allow clicks on the mapimage to create coordinates in an array
that leaflet understands. (You can see it in action in Areas#new and Areas#edit - it's commented)

## Drawing with Leaflet draw
```
<script>
	// Initialise the FeatureGroup to store editable layers
	var drawnItems = new L.FeatureGroup();
	map.addLayer(drawnItems);


	// Initialise and alter the draw control and pass it the FeatureGroup of editable layers
	var drawControl = new L.Control.Draw({
		draw: {
			//These options make up the root object that is used when initialising 
			//the Leaflet.draw control.
			position: 'topleft',
			polygon: {
				allowIntersection: false,
				drawError: {
					color: '#00dd00',
					timeout: 1000
				},
				shapeOptions: {
					color: '#00dd00',
				weight: 1
				},
				showArea: true
			},
			polyline:  false,
			rectangle:  {
				shapeOptions: {
					color: '#00dd00',
				weight: 1
				}
			},
			circle: false
        },
		edit: {
			featureGroup: drawnItems
		}
	});
	map.addControl(drawControl);
	
	
	//draw:created - Triggered when a new vector or marker has been created.
	map.on('draw:created', function (e) {
		var type = e.layerType,
			layer = e.layer;
		
		var shape = layer.toGeoJSON();
  		var shape_for_db = JSON.stringify(shape);

		drawnItems.addLayer(layer);
		//trying some things here
		//adding it the the value of a field
		document.getElementById('area_coords').value = shape_for_db;
	});
</script>
```

## Draw the shapes from the coords on the fullmap
```
<script>
	//A Leaflet map has one CRS (and one CRS only), that can be changed when creating the map. 
	//In a CRS.Simple, one horizontal map unit is mapped to one horizontal pixel, 

	<% if @mapimage.height.to_i > 10000 %>
	var map = L.map('map', {attributionControl: false, crs: L.CRS.Simple, minZoom: -6});
	<% elsif @mapimage.height.to_i > 5000 && @mapimage.height.to_i <= 10000 %>
	var map = L.map('map', {attributionControl: false, crs: L.CRS.Simple, minZoom: -5});
	<% elsif @mapimage.height.to_i > 2500 && @mapimage.height.to_i <= 5000 %>
	var map = L.map('map', {attributionControl: false, crs: L.CRS.Simple, minZoom: -4});
	<% else %>
	var map = L.map('map', {attributionControl: false, crs: L.CRS.Simple, minZoom: -3});
	<% end %>

	var attributionInfo = L.control.attribution({prefix: '<span class="AttributionClass">Map: <%= link_to @map.name, map_path(@map) %> | <%= @mapimage.width.to_i %>w, <%= @mapimage.height.to_i %>h</span>'}).addTo(map);


	//If working with [y, x] coordinates with something named L.LatLng doesn’t make much sense to you, 
	//you can easily create wrappers for them:
	var yx = L.latLng;

	var xy = function(x, y) {
		if (L.Util.isArray(x)) {    // When doing xy([x, y]);
			return yx(x[1], x[0]);
		}
		return yx(y, x);  // When doing xy(x, y);
	};

	//Then we can just add a L.ImageOverlay with the starmap image and its approximate bounds:

	var bounds = [xy(0,0), xy(<%= @mapimage.width %>,<%= @mapimage.height %>)];

	var image = L.imageOverlay('<%= @mapimage.mapimage_url %>', bounds).addTo(map);
	
	//map.setView(xy(120, 70), 1);
    map.fitBounds(bounds);
    
    // Restrict view to bounds
	//map.setMaxBounds(bounds);

    var popup = L.popup();
    
    //same on all maps - Now we can create our icons from this class and use them:
    <%= render 'areas/marker_variables' %>
    
    var leasingStatus = L.layerGroup();

    
    <% @mapareas.each do |area| %>//1. areas of primary map each
        
        var <%= 'd' + area.id.to_s + area.name.gsub(/\W\s?/, "") %> = <%= area.coords.html_safe %>;
    
        L.geoJson(<%= 'd' + area.id.to_s + area.name.gsub(/\W\s?/, "") %>, {
        pointToLayer: function (feature, latlng) {
        return L.marker(latlng, {<% if area.status == 'Available' %>icon: availableIcon<% elsif area.status == 'Prospect' %>icon: yellowIcon<% elsif area.status == 'Leased'  %>icon: greenIcon<% else %>icon: grayIcon <% end %>});
        }}).addTo(leasingStatus).bindPopup('<div style="width:300px;"><p style="margin-top:0;margin-bottom:4px;"><strong><%= link_to area.name, area_path(area) %></strong></p><hr style="margin-top:0;margin-bottom:6px;"><div style="float:left;width:48%;"><% if area.areaimages.blank? %><%= link_to image_tag('/images/231unavailable.png', :style => 'width:100% !important;float:left;margin-top:20px;margin-bottom:20px;'), area_path(area) %><% else %><% area.areaimages.each do |p| %><%= link_to image_tag(p.areaimage_url, :style => 'width:100% !important;float:left;'), area_path(area) %><% end %><% end %></div><div style="float:right;width:48%;"><p style="margin-top:4px;margin-bottom:4px;"><b>Status:</b> <%= area.status %><br><b>Sq Ft:</b> <%= number_with_delimiter(area.square_feet, :delimiter => ',') %><br><br><b>Info:</b><br> <%= area.info.truncate(60) %><br><br><%= link_to "More Info =>", area_path(area), :class => 'btn btn-primary' %></p></div><br style="clear:both;"></div>').setStyle({
    	<% if area.status == 'Available' %>fillColor: '#D13E27', color: '#D13E27', weight: 1, opacity: 0.9, fillOpacity: 0.6<% elsif area.status == 'Prospect' %>fillColor: '#dddd4e', color: '#dddd4e', weight: 1, opacity: 0.9, fillOpacity: 0.6<% elsif area.status == 'Leased' %>fillColor: '#8BC53F', color: '#8BC53F', weight: 1, opacity: 0.9, fillOpacity: 0.6<% else %>fillColor: '#dd0000', color: '#dd0000', weight: 1, opacity: 0.9, fillOpacity: 0.6<% end %>});

    <% end %>//1. END areas of primary map each
   
    leasingStatus.addTo(map);

</script>
```
