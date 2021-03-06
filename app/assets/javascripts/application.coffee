#= require jquery
#= require jquery_ujs
#= require_tree.

jQuery(document).ready ->

   # 모달 셋팅
  $('.ui.basic.modal')
  .modal('attach events', 'show')
  .modal('setting', {
    detachable: false,
    allowMultiple: false,
    observeChanges: false
  })
  .modal({
    blurring: true
  });


  #로그인 모달
  $('#sign_in').click ->
    console.log("로그인 모달 클릭을 함");
    $('.ui.basic.modal.sign_in').modal('show');

  $('#menu-pan').click ->
    $('.ui.basic.modal.sign_in').modal('show');

  #계정의 드롭다운
  $('.ui.pointing.dropdown').dropdown();
  $('.ui.fluid.dropdown').dropdown();

  # 로그인 실패시 가는 곳에 다른 배경을 준다.
  $('#sessions-new').css 'background-image', "url('/assets/1.jpg')"
  $('#sessions-new').css 'background-size', "cover"

  $

  # message 알림 시
  $('.message .close').on 'click', ->
    $(this).closest('.message').transition 'fade'
    return
