$(document).on('turbolinks:load', function () {
  function buildHTML(comment){
    var html = `<div class=comments__text__user>
                  <strong>
                    <div class=comment__user>
                      <a href=/users/${comment.user_id}>${comment.user_name}</a>
                    </div>
                    <div class=comment__massage__text>
                      ${comment.text}
                      </div>
                  </strong>
                <div>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comments').append(html);
      $('.textbox').val('');
      $('html,body').animate({scrollTop: $('.textbox').offset().top});
      $('.form__submit').prop('disabled', false);
    })
  })
});
