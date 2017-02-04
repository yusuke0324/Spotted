$(document).ready(function() {
  var map = new google.maps.Map(document.getElementById('map'), mapOptions);
  var marker = new google.maps.Marker(markerOptions);
	marker.setMap(map);
	
});

var mapOptions = {
    center: new google.maps.LatLng(37.7819057,-122.4536707),
    zoom: 16,
    mapTypeId: google.maps.MapTypeId.ROADMAP
};

var markerOptions = {
    position: new google.maps.LatLng(37.7819057,-122.4536707)
};

var options = {
  enableHighAccuracy: true,
  timeout: 5000,
  maximumAge: 0
};

function success(pos) {
  var crd = pos.coords;
  console.log (crd);
  console.log(`${crd.latitude}`);
  console.log(`${crd.longitude}`);
  console.log(`${crd.accuracy}`);
};

function error(err) {
  console.warn(`ERROR(${err.code}): ${err.message}`);
};

navigator.geolocation.getCurrentPosition(success, error, options);