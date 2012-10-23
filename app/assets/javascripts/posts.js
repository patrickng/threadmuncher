$(document).ready(function() {
  var text = $('#post_body'),
      link = $('#post_url');

  text.hide();
  text.prev().hide();

  $('#post_type_of_post').on('change', function(){
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

  if(!$(this).val()) {
    $('#post_url').change(function () {
      if($(this).val().indexOf("http://") !== 0 && $(this).val()) {
        this.value = "http://" + this.value;
      }
    });
  }
  $('.up a').click(function() {
    if ($(this).hasClass("highlight")) {
      $(this).removeClass("highlight");
    } else {
      $(this).addClass("highlight");
    }
    $(this).parents('.post-vote').find('.down a').removeClass("highlight");
  });
  $('.down a').click(function() {
    if ($(this).hasClass("highlight")) {
      $(this).removeClass("highlight");
    } else {
      $(this).addClass("highlight");
    }
    $(this).parents('.post-vote').find('.up a').removeClass("highlight");
  });
});