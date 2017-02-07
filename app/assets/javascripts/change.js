$(document).ready(function() {
  swit();
});
$(document).on('turbolinks:load', function(){
  swit();
});

var swit = function(){
	$("body").on("click", $("#right") ,function(e){
		console.log("yeag")
		$("#right").parent().siblings("div").toggleClass("owner_wants_to_rent")
		$(".owner").hide()

	})
}