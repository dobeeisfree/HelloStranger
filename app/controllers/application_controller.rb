class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :store_current_location, :unless => :devise_controller?
  before_filter :select_time

  protected
  def store_current_location
    store_location_for(:owner, request.url)
  end

  protected
  # 회원가입시, 특정 필드를 허용
  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up,
   keys: [:name, :contact_number, :email, :password, :password_confirmation])
  end

  # devise/registration/new
  # 2016-10-10 , dobeeisfree
  # 시간을 선택할 수 있도록 헬퍼메소드 만듦
  def select_time
    @time_picker = Array.new
    24.times do |hour|
       @time_picker.push("#{hour+1}:00")
       @time_picker.push("#{hour+1}:30") unless hour+1 == 24
    end
  end

end
