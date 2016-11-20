module Api::V1
  class UsersController < ApiController
    rescue_from (ActiveRecord::RecordNotFound) { |exception| handle_exception(exception, 404) }
    # For Foreigner

    # GET /v1/users
    # 모든 유저를 보여준다.
    def index
      @user = Foreigner.all
      render json: @user.to_json
    end


    # POST /v1/users
    # def create
    #   @user = Foreigner.new(user_sign_up_params)
    #   if @user.save
    #     render json: @user.to_json
    #   else
    #     render json: @user.errors, status: :unprocessable_entity
    #   end
    # end


    # GET /v1/users/new
    # 유저의 회원가입
    def new
      # 회원가입 시 받는 데이터는
      # user_sign_up_params에서 확인
      @user = Foreigner.new(user_sign_up_params)

      if @user.save
        render json: @user.to_json
      else
        # validate 값에서 걸러지면
        # error 메세지를 @user 객체에 반환
        render json: @user.errors, status: :unprocessable_entity
      end
    end


    # GET /v1/users/show
    def show
      # n번쨰 유저를 보여준다.
      @user = Foreigner.find(params[:id])
      render json: @user
    end

    # DELETE /v1/users/1
    # def destroy
    #   @user = Foreigner.find(params[:id])
    #   if @user.present?
    #     @user.destroy
    #     render status: :no_content
    #   else
    #     render status: :not_found
    #   end
    # end

    # GET /v1/users/delete
    def delete
      # n번째 유저의 정보를 삭제한다
      @user = Foreigner.find(params[:id])
      if @user.present?
        @user.destroy
        render status: :no_content
      end
    end

    # 사용자의 킵 저장
    # => 저장만 해..
    # GET /v1/users/keep
    def keep
      # params
      # => user_id 유저 찾아서
      # => store_id 를 유저 킵에 저장
      # output
      # => 유저의 keep 필드 업데이트

      @user = Foreigner.find(params[:user_id])
      @user.keep = @user.keep + '/' + params[:store_id].to_s if @user
      render @user, status: :ok if @user.save

    end

    protected
      def handle_exception(ex, status)
        render_error(ex, status)
        logger.error ex
      end


      def render_error(ex, status)
        @status_code = status
        respond_to do |format|
          format.json { render json: @user, :status => status }
          format.all { render :nothing => true, :status => status }
        end
      end


    private
      def user_sign_up_params
        # /v1/users/new?foreigners[name]=jubee&foreigners[password]=j1234& 등등
        params.require(:foreigners).permit(:name, :password, :for_taboo, :lang)
      end


  end
end
