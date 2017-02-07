$(document).ready(function() {
  swit();
});

$(document).on('turbolinks:load', function(){
  swit();
});

var swit = function(){


	$("body").on("click", $("#right") ,function(e){
		$(this).find("#owner").show()
		$("#renter").hide()
		$("#right").hide()
	})

}


