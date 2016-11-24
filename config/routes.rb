Rails.application.routes.draw do

  # 메인 라우트
  root 'home#index'

  # 계정
  devise_for :owners, controllers: {
      sessions: 'owners/sessions',
      registrations: 'owners/registrations',
      passwords: 'owners/passwords'
  }

  devise_scope :owner do
    get 'owners/confirm', to: 'owners/registrations#required'
  end


  # 리소스 모음
  # 메뉴
  resources :menus
  # 매장
  resources :stores

  # 오너의 마이페이지
  get 'mypage' => 'mypage#account'
  get 'mypage/account' => 'mypage#account'
  get 'mypage/manage_store' => 'mypage#manage_store'

  # 매장 현황
  get 'board' => 'board#quick'
  get 'board/quick' => 'board#quick'
  get 'board/report' => 'board#report'

  # for api
  scope module: 'api' do
      namespace :v1 do

        get 'transfer/menu_name' => 'transfer#menu_name'

        get 'users/delete' => 'users#delete'
        get 'users/login' => 'users#login'
        get 'users/logout' => 'users#logout'
        get 'users/save_keep' => 'users#save_keep'
        get 'users/check_auth_token' => 'users#check_auth_token'
        resources :users

        get 'around/beacon_stores' => 'around#beacon_stores'
      end
  end



end
