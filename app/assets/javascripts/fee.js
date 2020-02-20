$(function() {
  $('#price--box').keyup(function() {  
    var data = $(this).val();  
    var fee = Math.floor(data * 0.1)
    var profit = (data - fee)
    $('.fee--box').text(fee)
    $('.fee--box').prepend('¥')
    $('.profit--box').text(profit)
    $('.profit--box').prepend('¥')
    if (data == '') {
      $('.fee--box').text('-')
      $('.profit--box').text('-')
    }
  });
});
