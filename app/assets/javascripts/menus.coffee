jQuery(document).ready ->

  $('.ui .fluid .image').dimmer({
    on: 'hover'
  });

  # index.html.erb
  action_name = $('#action_name').val();
  if action_name == 'index'
    $('.ui.foodglossary.search').search
      apiSettings:
        url: '/v1/transfer/menu_name?q={query}'
      cache: false
      searchFullText: false
      onResults: (response) ->
        html = ''
        if response != undefined
          $.each response['results'], (index, result) ->
            text = response['results'].pop()
            console.log(text)
            html += '<a class="result"><div class="content">'
            html += '<div class="title">' + text['id'] + '. <small>' + text['kor']  + '</small>' + '</div>'
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
