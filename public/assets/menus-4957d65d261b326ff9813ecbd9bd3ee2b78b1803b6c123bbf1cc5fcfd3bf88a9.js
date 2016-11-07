(function() {
  jQuery(document).ready(function() {
    var action_name;
    $('.ui .fluid .image').dimmer({
      on: 'hover'
    });
    action_name = $('#action_name').val();
    if (action_name === 'index') {
      return $('.ui.foodglossary.search').search({
        apiSettings: {
          url: '//localhost:3000/transfer/menu_name?q={query}'
        },
        cache: false,
        searchFullText: false,
        onResults: function(response) {
          var html;
          html = '';
          if (response !== void 0) {
            $.each(response['results'], function(index, result) {
              var text;
              text = response['results'].pop();
              text = text['kor'];
              console.log(text);
              html += '<a class="result"><div class="content">';
              html += '<div class="title">' + text + '</div>';
              html += '' + '</div></a>';
              return index < 6;
            });
          }
          return $('.ui.foodglossary.search div.results').html(html);
        },
        onResultsAdd: function(html) {
          if ($('div.results a').length === 0) {
            return 'default';
          } else {
            return false;
          }
        }
      });
    }
  });

}).call(this);
