jQuery(document).ready ->

  $('.ui .fluid .image').dimmer({
    on: 'hover'
  });

  # index.html.erb
  action_name = $('#action_name').val();
  if action_name == 'index'
    $('.ui.foodglossary.search').search
      apiSettings:#아래 url는 바뀔 수 있다.
        url: '//hello-stranger-dobeeisfree.c9users.io/v1/transfer/menu_name?q={query}'
      cache: false
      searchFullText: false
      onResults: (response) ->
        html = ''
        if response != undefined
          $.each response['results'], (index, result) ->
            text = response['results'].pop()
            text = text['kor']
            console.log(text)
            html += '<a class="result"><div class="content">'
            html += '<div class="title">' + text + '</div>'
            html += '' + '</div></a>'
            return index < 6
        $('.ui.foodglossary.search div.results').html(html)
      onResultsAdd: (html) ->
        if $('div.results a').length == 0
          return 'default'
        else
          return false
  # ---
  # by dobeeisfree
