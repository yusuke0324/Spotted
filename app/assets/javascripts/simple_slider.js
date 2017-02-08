$( document ).on('turbolinks:load', function(){
	var myIndex = 0;
    carousel();

	function carousel() {
    var i;
    var x = $(".swiper-slide");
    if (x.length ==0){
        return false;
    }
    console.log(x)
    console.log(x.length);
    for (i = 0; i < x.length; i++) {
        console.log(x);
       x[i].style.display = "none"; 
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}

    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 4000); // Change image every 2 seconds
	}
	
});