$(function() {

  $('.emoticon').hover(function() {
    $('#preview').css('visibility', 'inherit');
    var shortcut = $(this).data('shortcut');
    $('#shortcut').text(shortcut);
  });

  // Cache jQuery Objects
  var $emoticon = $('.emoticon'),
      $input = $('#input');

  // emoticon filter function
  function filter(element) {
    // Hide all emoticon at start of search
    $emoticon.hide();

    // Capture user input
    var search = new RegExp( $('#input').val(), "i" );

    // Show only requested emoticon
    $emoticon.filter(function() {
      // Return only the emoticon whose shortcut text matches
      return search.test( $(this).data('shortcut') );
    }).show();
  }

  // Prompt user with emoticon shortcut on click
  function copy(shortcut) {
    window.prompt("Here's that shortcut, sailor.", shortcut);
    clear();
  }

  // Clear the input field and re-bind the keyup event
  function clear() {
    $input.val('');
    $emoticon.show();
  }

  // Trigger the copy prompt if user presses enter with one result
  $input.on('keyup', function(e) {

    // Filter emoticon on input
    filter(this);

    // ----------------------------------
    // Prompt shortcut on return keypress
    // ----------------------------------

    // Cache visibile emoticon
    var $result = $('.emoticon').not(':hidden');
    var shortcut = $result.data('shortcut');

    // User has pressed "enter"
    if ( e.keyCode === 13 && $result.length === 1 ) {
      // Send the emoticon shortcut prompt
      copy( "(" + shortcut + ")" );

      // Reload the page
      location.reload();
    }
  });

  // Trigger the copy prompt when an emoticon is clicked
  $('.emoticon').click(function(e) {
    copy( '(' + $(this).data('shortcut') + ')' );
  });

  // ----
  // Misc.
  // ----

  // Clear the input field and auto-focus on load
  $input.val('').focus();

});
