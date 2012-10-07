$(document).ready(function() {
  var text = $('#post_body'),
      link = $('#post_url');

  text.hide();
  text.prev().hide();

  $('#post_type_of_post').on('change', function(){
    console.log($(this).val());
    if ($(this).val() == "2") {
      link.hide();
      link.prev().hide();
      text.show();
      text.prev().show();
    } else if ($(this).val() == "1") {
      link.show();
      link.prev().show();
      text.hide();
      text.prev().hide();
    }
  });
});