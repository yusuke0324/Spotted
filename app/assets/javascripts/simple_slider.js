$( document ).on('turbolinks:load', function(){

	var myIndex = 0;

	function carousel() {
    var i;
    var x = document.getElementsByClassName("swiper-slide");
    console.log(x.length);
    for (i = 0; i < x.length; i++) {
       $(x[i]).attr("display", "none");  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    $(x[myIndex-1]).attr("display", "block");  
    setTimeout(carousel, 4000); // Change image every 2 seconds
	}
	carousel();
});