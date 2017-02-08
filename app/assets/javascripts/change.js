$(document).ready(function() {
  swit();
});

$(document).on('turbolinks:load', function(){
  swit();
});

var swit = function(){


	$("#right").on("click" ,function(e){
		$("body").find("#owner").show()
		$("#renter").hide()
		$("#right").hide()
	})

}


