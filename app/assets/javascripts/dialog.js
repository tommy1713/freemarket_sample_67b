$(document).on('turbolinks:load', function() {
  $("#destroy--btn").click(function(e){
    e.preventDefault();
    $('#dialog').fadeIn();
  });

  $('#close').click(function() {
    $('#dialog').fadeOut();
  });
});
