(function() {
  jQuery(document).ready(function() {
    return $('#go-down').click(function() {
      var scrollHeight;
      scrollHeight = $('#about').height() + $('#menus').height() + $('#for-owner').height();
      return $("html, body").animate({
        scrollTop: $(document).height() - scrollHeight
      }, 'slow');
    });
  });

}).call(this);
