$(document).on('turbolinks:load', function() {
  $("#destroy--btn").click(function(e){
    console.log("open")
    e.preventDefault();
    $('#dialog').fadeIn();
  });

  $('#close').click(function() {
    console.log("close")
    $('#dialog').fadeOut();
  });
});
