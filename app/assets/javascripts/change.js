$(document).on('turbolinks:load', function(){
  swit();
});

var swit = function(){


	$("body").on("click","#right",function(e){
		$("#owner").show()
		$("#renter").hide()
		$("#right").hide()
	})

  $("body").on("click", ".rent-spots",function(e){
    $(this).find("#owner").hide()
    $("#renter").show()
    $("#right").show()
  })

}


