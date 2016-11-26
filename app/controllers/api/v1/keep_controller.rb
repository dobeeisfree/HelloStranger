module Api::V1
  class KeepController < ApiController


    # GET /v1/keep/index
    def index
      # 유저가 킵을 눌렀을 때,
      # 나오는 가게들을 반환한다.

      # params
      # => user_id

      @user = Foreigner.find(params[:user_id]) if Foreigner.last.id >= params[:user_id].to_i && Foreigner.first.id <= params[:user_id].to_i
      render json: '유저가 없네요!'.to_json, status: :not_found if @user.nil?

      if @user
        # 중복된 값을 없애서 리스트를 만든다.
        @keep_list = @user.keep.split('/').uniq
        render nothing: :true, status: :not_found if @keep_list.nil?
      end

      if @keep_list
        @store_list = Hash.new

        @stores = Array.new
        @keep_list.each do |k|
          @stores << Store.find(k.to_i)
        end

        @store_list['store'] = @stores

        render json: @store_list.to_json, status: :ok if @stores
        render :nothing => true , status: :ok if @stores.nil?
      end

    end


    # GET /v1/keep/save
    def save
      # params
      # => user_id, store_id
      # => 유저의 keep 필드에 store_id를 담아 업데이트

      @user = Foreigner.find(params[:user_id]) if Foreigner.last.id >= params[:user_id].to_i
      render nothing: :true, status: :not_found if @user.nil?
      pushed_stores = params[:store_id].to_s + '/' if Store.last.id >= params[:store_id].to_i
      render nothing: :true, status: :not_found if pushed_stores.nil?

      if pushed_stores && @user
        @user.keep = @user.keep + pushed_stores  if @user
        render json: @user.keep.to_json, status: :ok if @user.save!
      end
    end


    # GET /v1/keep/delete_all
    def delete_all
      # params
      # => user_id

      @user = Foreigner.find(params[:user_id]) if Foreigner.last.id >= params[:user_id].to_i && Foreigner.first.id <= params[:user_id].to_i
      render json: '유저가 없네요!'.to_json, status: :not_found if @user.nil?

      if @user
        @user.keep = ""
        render nothing: :true, status: :no_content if @user.save!
      end

    end


  end
end