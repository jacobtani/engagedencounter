$('.question').click(function (e) {
  e.preventDefault();
  $('.answer').addClass('hidden');
  var content_id = $(this).attr('class');
  var numb = content_id.match(/\d/g).join("");
  var total = '.a' + numb;
  debugger
  $(total).removeClass('hidden');
});
