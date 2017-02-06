$(document).ready(function() {
  getLocation();
});

// Function to determin user's current location using HTML5 geolocation (asynchronous)
var getLocation = function(callback) {
  navigator.geolocation.getCurrentPosition(function (data) {
    var jsonLocation = {"latitude": data.coords.latitude, "longitude": data.coords.longitude};
    var markerOptions = {
        position: new google.maps.LatLng(data.coords.latitude, data.coords.longitude)
    };
    var mapOptions = {
    center: new google.maps.LatLng(data.coords.latitude, data.coords.longitude),
    zoom: 16,
    mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById('map'), mapOptions);
    var marker = new google.maps.Marker(markerOptions);
    resizer(map);
    marker.setMap(map);
    if (gon.reservation){
      spotDirections(jsonLocation, map);
    } else {
      findSpots(jsonLocation, map);
    };
  });
};

// Ajax call to server to send latitude and longitude of user's current location
var findSpots = function(coordinates, currentMap) {
  var selection = $(location).attr("href");
  var spotRequest = $.ajax({
    type: "GET",
    url: selection,
    dataType: "json",
    data: {"latitude": coordinates.latitude, "longitude": coordinates.longitude}
  });
  spotRequest.done(function(response){
    response.selections.forEach(function(location){
      var image = {
        url: "https://cdn1.iconfinder.com/data/icons/unique-round-blue/93/location-512.png",
        scaledSize: new google.maps.Size(35,35),
        origin: new google.maps.Point(0,0),
        anchor: new google.maps.Point(0,0)
      };
      var spotOptions = {
        position: new google.maps.LatLng(location.latitude, location.longitude),
        icon: image,
        label: "$" + location.price.toString(),
        animation: google.maps.Animation.DROP,
        id: location.id
      };
      // var infowindow = new google.maps.InfoWindow({
      //   content: location.price,
      //   maxWidth: 200
      // });
      var marker = new google.maps.Marker(spotOptions);
      marker.setOptions({'opacity': 0.75});
      marker.setMap(currentMap);
      marker.addListener('click', function() {
          // infowindow.open(currentMap, marker);
          window.location.href = "/spots/" + marker.id;
        });
    });
  });
}

var spotDirections = function(coordinates, currentMap) {
   var directionsDisplay = new google.maps.DirectionsRenderer();
    directionsDisplay.setMap(currentMap);
    var directionsService = new google.maps.DirectionsService();
    var start = new google.maps.LatLng(coordinates.latitude, coordinates.longitude);
    var end = new google.maps.LatLng(gon.latitude, gon.longitude);
    var request = {
      origin: start,
      destination: end,
      travelMode: 'DRIVING'
    };
    directionsService.route(request, function(result, status) {
      if (status == 'OK') {
        directionsDisplay.setDirections(result);
      }
    });
}

var resizer = function(currentMap){
  google.maps.event.addDomListener(window, "resize", function() {
    var center = currentMap.getCenter();
    google.maps.event.trigger(currentMap, "resize");
    currentMap.setCenter(center);
  });
};