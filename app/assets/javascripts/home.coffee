# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery(document).ready ->
  $('#go-down').click -> #스크롤다운 기능
    scrollHeight = $('#about').height() + $('#menus').height() + $('#for-owner').height()
    $("html, body").animate({ scrollTop: $(document).height() - scrollHeight }, 'slow');
