var map = null;
var polyline = null;
var polyOptions = { geodesic:true };


document.observe("dom:loaded", function() {
    initialize();
    refreshCoordsPeriodically();
});


function initialize() {
    if (GBrowserIsCompatible()) {
        afterInitialize();
    }
}

function afterInitialize() {
    map = new GMap2(document.getElementById("map_canvas"));
    map.setCenter(new GLatLng(50.9736111111111, 11.0225), 6);

}

function createLengthMarker(point) {
    var marker = new GMarker(point);
    var value = polyline.getLength();
    value = value / 1000;
    var message = "The length of this great circle is: " + value + " kilometers.";
    GEvent.addListener(marker, "click", function() {
        var myHtml = message;
        map.openInfoWindowHtml(point, myHtml);
    });
    return marker;
}

function refreshCoords() {
    new Ajax.Request("file:///Users/jfischer/git/darwins_playground/gui/current_coords.txt", {
        method: 'get',
        onSuccess: function(transport) {
            var response = transport.responseText || "no response text";
            eval(response);
            //alert("Success! \n\n" + response);

        },
        onFailure: function() {
            alert('Something went wrong...')
        }
    });
    map.clearOverlays();
    map.addOverlay(polyline);
}


function refreshCoordsPeriodically() {
    new PeriodicalExecuter(refreshCoords, 1);

}


function createSomePolyline() {
    polyline = new GPolyline([
        new GLatLng(51.4580555555556, 7.01472222222222),
        new GLatLng(53.0775, 8.80722222222222),
        new GLatLng(54.7802777777778, 9.43583333333333),
        new GLatLng(54.3225, 10.1358333333333),
        new GLatLng(53.6255555555556, 11.4166666666667),
        new GLatLng(54.0902777777778, 12.1330555555556),
        new GLatLng(52.3472222222222, 14.5502777777778),
        new GLatLng(52.5233333333333, 13.4113888888889),
        new GLatLng(52.1308333333333, 11.6366666666667),
        new GLatLng(53.5533333333333, 9.99194444444444),
        new GLatLng(52.3722222222222, 9.73555555555556),
        new GLatLng(51.3188888888889, 9.49611111111111),
        new GLatLng(50.9736111111111, 11.0225),
        new GLatLng(51.3397222222222, 12.3713888888889),
        new GLatLng(51.0508333333333, 13.7336111111111),
        new GLatLng(49.4505555555556, 11.0805555555556),
        new GLatLng(48.1391666666667, 11.5802777777778),
        new GLatLng(48.7772222222222, 9.18083333333333),
        new GLatLng(49.2347222222222, 6.99444444444444),
        new GLatLng(50.1113888888889, 8.68055555555556),
        new GLatLng(50.7327777777778, 7.09638888888889),
        new GLatLng(51.4580555555556, 7.01472222222222),
    ], "#FF0000", 3, 1, polyOptions);


    map.addOverlay(polyline);
    map.addOverlay(createLengthMarker(new GLatLng(50.9736111111111, 11.0225)));
}