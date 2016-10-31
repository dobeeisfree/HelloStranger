Rails.application.routes.draw do

  # 메인 라우트
  root 'home#index'
  # 계정
  devise_for :owners, controllers: {
      sessions: 'owners/sessions',
      registrations: 'owners/registrations',
      passwords: 'owners/passwords'
  }

  # 리소스 모음
  # 메뉴
  resources :menus
  # 매장
  resources :stores

  # 오너의 마이페이지
  get 'mypage' => 'mypage#account'
  get 'mypage/account' => 'mypage#account'
  get 'mypage/manage_store' => 'mypage#manage_store'


  #번역시스템
  get 'transfer/menu_name' => 'transfer#menu_name'

end
