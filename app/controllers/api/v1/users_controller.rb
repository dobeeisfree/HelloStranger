require 'securerandom'
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
    def new
      # 유저의 회원가입
      # => user_sign_up_params
      @user = Foreigner.new(user_sign_up_params)

      if @user.save
        render json: @user.to_json
      else
        # validate 값에서 걸러지면
        # error 메세지를 @user 객체에 반환
        render json: @user.errors, status: :unprocessable_entity
      end
    end


    # GET /v1/users/login
    def login
      # 안드로이드에서 아이디와 비밀번호로 요청
      # 서버에서는 토큰을 발급하고 세션에 저장한다.

      # params
      # =>name, password

      # 파라미터 값 유효 검사
      @msg = Hash.new
      @msg['name'] = '이름이 없어요!' if params[:name].present?
      @msg['password'] = '비밀번호가 없어요!' if params[:password].present?
      @msg = nil if params.has_key? (:name) && params.has_key? (:password)
      render json: @msg.to_json, status: :not_found unless @msg.nil?

      @user = Foreigner.find_by(name: params[:name], password: params[:password])
      if @user.present?
        # 토큰을 발급한다.
        set_auth_token(@user)
        render json: @user, status: :ok
      else
        @msg = Hash.new
        @msg["error"] = "유저를 찾을 수 없습니다."
        render json: @msg, status: :not_found
      end

    end


    # GET /v1/users/logout
    def logout
    # 토큰을 해제한다.

    # params
    # => id

      @user = Foreigner.find(params[:id])
      render status: :not_found if @user.nil?

      @user.auth_token = nil if @user.present?
      render status: :ok

    end


    # GET /v1/users/check_auth_token
    def check_auth_token
      # 발급된 토큰이 있으면 로그인 된것이다.
      # 안드로이드에 특정 메세지값 반환. => 혹시나 모를 메세지용!

      # params
      # => auth_token

      @msg = "hello, stranger!" if params[:auth_token]
      @msg = "Please, login again" if params[:auth_token].blank?

      render json: @msg

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
      # params
      # => id
      @user = Foreigner.find(params[:id])
      if @user.present?
        @user.destroy
        render status: :no_content
      end
    end


    protected
    # render error시 나타나는 에러뷰를 커스텀
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
      # 사용자 회원가입시 필요한 파라미터
      params.require(:foreigners).permit(:name, :password, :for_taboo, :lang)
    end


    # Token Based Authentication in Rails
    protected
    def authenticate
      authenticate_token || render_unauthorized
    end

    def authenticate_token
      authenticate_or_request_with_http_token do |token, options|
        Foreigner.find_by(auth_token: token)
      end
    end

    def render_unauthorized
      self.headers['WWW-Authenticate'] = 'Token realm="Application"'
      render json: 'Bad credentials', status: 401
    end

    private
    def set_auth_token(user)
      return if user.auth_token.present?
      user.auth_token = generate_auth_token
      user.save
    end

    def generate_auth_token
      SecureRandom.uuid.gsub(/\-/,'')
    end

  end
end
