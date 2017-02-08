$(document).ready(function () {
    // $( document ).on('turbolinks:load', function() {
    // console.log("test");
    //Initialize tooltips
    navigation();

    // drag stuff
    $(".drag-area").bind("drop", function(e){
        e.preventDefault();
        console.log("dropped")
        var newFile = e.originalEvent.dataTransfer.files[0];
        console.log(newFile);
        $("#spot_picture").prop("files", e.originalEvent.dataTransfer.files);

    }).bind('dragenter', function() {
            return false;
        }).bind('dragover', function() {
            return false;
        });
    $(".drag-area").click(function(){
        $("#spot_picture").click();
    })

    // show preview
    function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {

        $(".drag-area").css('background-image','url("' + e.target.result + '")' );
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $("#spot_picture").change(function(){
    readURL(this);
  });
});

$(document).on('turbolinks:load', function(){
    navigation();

});

function nextTab(elem) {
    // console.log("next tab called")
    $(elem).next().find('a[data-toggle="tab"]').click();
}
function prevTab(elem) {
    $(elem).prev().find('a[data-toggle="tab"]').click();
}

var navigation = function(){
    $('.nav-tabs > li a[title]').tooltip();
    
    //Wizard
    $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {

        var $target = $(e.target);
    
        if ($target.parent().hasClass('disabled')) {
            return false;
        }
    });

    $(".next-step").click(function (e) {
        // console.log("next step click")
        var $active = $('.wizard .nav-tabs li.active');
        $active.next().removeClass('disabled');
        nextTab($active);

    });
    $(".prev-step").click(function (e) {

        var $active = $('.wizard .nav-tabs li.active');
        prevTab($active);

    });
}
