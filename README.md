# Mapping Leaflet

Simplifying what I know on this subject.

https://mapping-with-leaflet.herokuapp.com

...and now we build.

This app has user authenication with Devise, and mapping with leaflet.js. 
I figured out a clever way to allow clicks on the mapimage to create coordinates in an array
that leaflet understands. (You can see it in action in Areas#new and Areas#edit - it's commented)

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


		
		//alert(shape_for_db);
		document.getElementById('area_coords').value = shape_for_db;
	});
</script>
```