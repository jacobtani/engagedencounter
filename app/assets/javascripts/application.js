// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .
$(document).ready(function() {

  $(".question").click(function (e) {
       e.preventDefault();
       var content_id = $(this).attr("class");
       $(".answer").addClass("hidden");
       var numb = content_id.match(/\d/g).join("");
       var total = ".a" + numb;
       $(total).removeClass("hidden");
  });
  $('.a1').addClass('hidden');
  $('.a2').addClass('hidden');
  $('.a3').addClass('hidden');
  $('.a4').addClass('hidden');
  $('.a5').addClass('hidden');
  $('.a6').addClass('hidden');
  $('.a7').addClass('hidden');
  $('.a8').addClass('hidden');
  $('.a9').addClass('hidden');
  $('.a10').addClass('hidden');
  $('.a11').addClass('hidden');
  $('.a12').addClass('hidden');

  var dropdown = $("#main-navbar li.dropdown");

  $("a[data-toggle='dropdown']").click(function(){
    dropdown.addClass('active');
    $('.dropdown-element').addClass('open');

  });
});
