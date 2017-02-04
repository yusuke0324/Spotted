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
