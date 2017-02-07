$(document).ready(function() {
  swit();
});

$(document).on('turbolinks:load', function(){
  swit();
});

var swit = function(){
	$("#container").on("click", "#right" ,function(e){
		e.preventDefault();
		console.log("yeag")
		$("#right").parent().siblings("div").toggleClass("owner_wants_to_rent")
		$(".owner").hide()

	})

}



}

