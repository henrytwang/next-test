// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.Jcrop
//= require jquery.cookie
//= require foundation
//= require_tree .


function showFeedbackForm(c)
{
  // variables can be accessed here as
  // c.x, c.y, c.x2, c.y2, c.w, c.h
  $(".feedback-bar").show();
  $("input[id=x_coordinate]").val(c.x);
  $("input[id=y_coordinate]").val(c.y);
  $("input[id=width]").val(c.w);
  $("input[id=height]").val(c.h);
  $("#feedback_first_answer").focus();
}

function hideFeedbackForm()
{
  $(".feedback-bar").hide();
}

jQuery.ajaxSetup({
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript");}
});

jQuery(document).ready(function($){

  $(document).foundation();

  $(".feedback-bar").hide();

  $('.text-field').click(function(){
    $('.text-field').attr("value", "http://");
    var input = $(".text-field");
    var len = input.val().length;
    input[0].focus();
    input[0].setSelectionRange(len, len);
  });

  $('.disableTooltips').click(function(){
    $(".joyride-close-tip").click();
    $.cookie("joyrideEnabled", "false", { expires: 7 });
  });

  $('.cropbox').Jcrop({
    addClass: 'jcrop-light',
    onSelect: showFeedbackForm,
    onRelease: hideFeedbackForm
  });



});