var clip = null;

function addEventForZeroClipboard(){
  
  // assign a common mouseover function for all elements using jQuery
  jQuery('span.multiple').live('mouseover', function() {
    // get text
    var text = jQuery(this).attr("text_value");
    // decode after 'CGI.escape' and decode '+' as 'space'
    text = decodeURIComponent((text).replace(/\+/g, '%20'));
    // set the clip text
    clip.setText( text );
    // reposition the movie over our element
    // or create it if this is the first time
    if (clip.div) {
      clip.receiveEvent('mouseout', null);
      clip.reposition(this);
     } else clip.glue(this);
     var correct_top = parseFloat(jQuery(clip.div).css('top')) - 5;
     jQuery(clip.div).css('top', correct_top + 'px');
    // gotta force these events due to the Flash movie
    // moving all around. This insures the CSS effects
    // are properly updated.
    clip.receiveEvent('mouseover', null);
  });
  
};


jQuery(document).ready(function() {
  
  ZeroClipboard.setMoviePath( '/assets/zeroclipboard/dependencies/zeroclipboard10.swf' );
  // setup single ZeroClipboard object for all our elements
  clip = new ZeroClipboard.Client();
  clip.setHandCursor( true );
  addEventForZeroClipboard();
  
});