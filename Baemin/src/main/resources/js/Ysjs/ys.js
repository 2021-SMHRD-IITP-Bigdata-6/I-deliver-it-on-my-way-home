marker.addListener("dragend", function(evt) {

	console.log("dragend=" + evt.latLng);
	var drag = evt.latLng.toString();
	console.log(drag);
	return drag;
});