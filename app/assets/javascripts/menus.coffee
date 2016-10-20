jQuery(document).ready ->

  $('.ui .fluid .image').dimmer({
    on: 'hover'
  });

  $('.ui.search')
    .search({
      apiSettings: {
        url: 'http://localhost:3000/transfer/search_kor_menu_name'
      },
      fields: {
        results: 'items',
        title: 'name',
      },
      minCharacters : 1
    })
  ;
