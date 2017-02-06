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
    marker.setMap(map);
    findSpots(jsonLocation, map);
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
        scaledSize: new google.maps.Size(40,40),
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
      marker.setMap(currentMap);
      marker.addListener('click', function() {
          // infowindow.open(currentMap, marker);
          // window.location.href = "/spots/" + marker.id;
        });
    });
  });
}