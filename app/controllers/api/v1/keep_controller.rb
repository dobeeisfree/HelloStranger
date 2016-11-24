module Api::V1
  class KeepController < ApiController


    # GET /v1/keep/index
    def index
      # params
      # => user_id
      # 중복된 값을 없애서 리스트를 만든다.
      @keep_list = Foreigner.find(params[:user_id]).keep.split('/').uniq! if params[:user_id].present?
      render status: :not_found if params[:user_id].nil?

      @stores = Array.new
      @keep_list.each do |k|
        @stores << Store.find(k.to_i)
      end

      render json: @stores.to_json, status: :ok if @stores
      render json: nothing, status: :ok if @stores.nil?
    end


    # GET /v1/keep/save
    def save
      # params
      # => user_id, store_id
      # => 유저의 keep 필드에 store_id를 담아 업데이트

      @user = Foreigner.find(params[:user_id]) unless params[:user_id].blank?
      render status: :not_found if @user.nil?

      pushed_stores = params[:store_id].to_s + '/'
      @user.keep = @user.keep + pushed_stores  if @user
      render json: @user.to_json, status: :ok if @user.save

    end


    # GET /v1/keep/delete_all
    def delete_all
      # params
      # => user_id

      @user = Foreigner.find(params[:user_id]) unless params[:user_id].blank?
      render status: :not_found if @user.nil?

      @user.keep = ""
      @user.save
      render status: :no_content

    end


  end
end