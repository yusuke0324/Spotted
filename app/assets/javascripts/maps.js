$(document).ready(function() {
  getLocation();
});


var getLocation = function(callback) {

  navigator.geolocation.getCurrentPosition(function (data) {

    var jsonLocation = data.coords.latitude+','+data.coords.longitude;

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
  });
};