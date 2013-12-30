$(function() {
  $('.emoticon').hover(function() {
    $('#preview').css('visibility', 'inherit');
    var shortcut = $(this).data('shortcut');
    $('#shortcut').text(shortcut);
  })
});
