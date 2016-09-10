jQuery(document).ready ->
  #스크롤다운 기능
  $('#go-down').click ->
    scrollHeight = $('#about').height() + $('#menus').height() + $('#for-owner').height()
    $("html, body").animate({ scrollTop: $(document).height() - scrollHeight }, 'slow');
