jQuery(document).ready ->

  $('.ui .fluid .image').dimmer({
    on: 'hover'
  });

  # index.html.erb
  action_name = $('#action_name').val();
  if action_name == 'index'
    # 메뉴명
    $('.ui.foodglossary.search').search
      apiSettings:
        url: '/v1/search/menu_name?q={query}'
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
    # 맛
    $('.ui.taste.search').search
      apiSettings:
        url: '/v1/search/taste?q={query}'
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
        $('.ui.taste.search div.results').html(html)
      onResultsAdd: (html) ->
        if $('div.results a').length == 0
          return 'default'
        else
          return false
    # 재료
    $('.ui.foodstuff.search').search
      apiSettings:
        url: '/v1/search/foodstuff?q={query}'
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
        $('.ui.foodstuff.search div.results').html(html)
      onResultsAdd: (html) ->
        if $('div.results a').length == 0
          return 'default'
        else
          return false
    # 조리법
    $('.ui.cookingmethod.search').search
      apiSettings:
        url: '/v1/search/cookingmethod?q={query}'
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
        $('.ui.cookingmethod.search div.results').html(html)
      onResultsAdd: (html) ->
        if $('div.results a').length == 0
          return 'default'
        else
          return false

  # ---
  # by dobeeisfree
