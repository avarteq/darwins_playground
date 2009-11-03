var map = null;
var polyline = null;
var polyOptions = { geodesic:true };


document.observe("dom:loaded", function() {
    initialize();
    refreshCoordsPeriodically();
});


function initialize() {
    if (GBrowserIsCompatible()) {
        map = new GMap2(document.getElementById("map_canvas"));
        map.setCenter(new GLatLng(50.9736111111111, 11.0225), 6);
    }
}


function refreshCoords() {
	
	/* file:///Users/jfischer/git/darwins_playground/gui/ajax_map.html
	 * --> "file:///Users/jfischer/git/darwins_playground/gui/current_coords.txt"
	 */
	var coords_url = location.href.gsub("ajax_map.html", "current_coords.txt");
    new Ajax.Request(coords_url, {
        method: 'get',
        onSuccess: function(transport) {
            var response = transport.responseText || "no response text";
            eval(response);
        },
        onFailure: function() {
            alert('Something went wrong...')
        }
    });
    map.clearOverlays();
    map.addOverlay(polyline);
}


function refreshCoordsPeriodically() {
    new PeriodicalExecuter(refreshCoords, 0.1);

}
