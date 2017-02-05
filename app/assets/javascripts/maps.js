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
      console.log(location.id)
      var spotOptions = {
        position: new google.maps.LatLng(location.latitude, location.longitude),
        title: location.address,
        animation: google.maps.Animation.DROP,
        id: location.id
      };
      var marker = new google.maps.Marker(spotOptions);
      marker.setMap(currentMap);
      marker.addListener('click', function() {
          window.location.href = "/spots/" + marker.id;
        });
    });
  });
}