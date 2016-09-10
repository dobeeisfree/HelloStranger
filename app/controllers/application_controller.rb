class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :store_current_location, :unless => :devise_controller?

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
end
