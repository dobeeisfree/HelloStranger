class Owners::RegistrationsController < Devise::RegistrationsController
# before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # GET /resource/confirm
  # 매장 주인이라면, 반드시 하나의 매장을 가지고 있어야한다.
  def required
    @store = Store.new
    if params.has_key?(:beacon_id)
      @store = Store.new(require_store)
      @store.owner_id = current_owner.id

      respond_to do |format|
        if @store.save
          format.html { redirect_to root_path, notice: 'Store was successfully created.' }
          format.json { render :show, status: :created, location: @store }
        else
          @owner = Owner.find_by(id: current_owner.id)
          @owner.destroy
          format.html { render :new }
          format.json { render json: @store.errors, status: :unprocessable_entity }
        end
      end
      
    end
  end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
    puts resource
    stored_location_for(resource) || owners_confirm_path
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  private
    def require_store
      params.require(:store).permit(:name, :location, :beacon_id, :business_id,
       :main_picture, :category, :open_time, :close_time)
    end
end
