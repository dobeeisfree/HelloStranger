module Api::V1
  class UsersController < ApiController
    rescue_from (ActiveRecord::RecordNotFound) { |exception| handle_exception(exception, 404) }


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
