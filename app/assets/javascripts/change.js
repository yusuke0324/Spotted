$(document).ready(function() {
  swit();
  manage();
});

var swit = function(){
	$("body").on("click", $("#right") ,function(e){
		console.log("yeag")
		$("#right").parent().siblings("div").toggleClass("owner_wants_to_rent")
		$(".owner").hide()

	})
}


var manage = function(){

}