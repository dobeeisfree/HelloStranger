jQuery(document).ready ->

  $('.ui .fluid .image').dimmer({
    on: 'hover'
  });

  # index.html.erb
  action_name = $('#action_name').val();
  if action_name == 'index'
    $('.ui.foodglossary.search').search
      apiSettings:
        url: '//localhost:3000/transfer/menu_name?q={query}'
      cache: false
      searchFullText: false
      searchFields: 'kor'
      onResults: (response) ->
        html = ''
        if response != undefined
          $.each response['results'], (index, result) ->
            text = response['results'].pop()
            text = text['kor']
            console.log(text)
            html += '<a class="result"><div class="content">'
            html += text + '</div>'
            html += '' + '</div></a>'
            return index < 6
          $('.ui.foodglossary.search div.results').html(html)
        return false
      onResultsAdd: (html) ->
        if $('div.results a').length == 0
          return '결과가 없네요'
        else
          return false
  # ---
  # by dobeeisfree
