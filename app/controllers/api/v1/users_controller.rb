module Api::V1
  class UsersController < ApiController

    # GET /v1/users
    def index
      @user = Foreigner.all
      render json: @user.to_json
    end
    
    # POST /v1/users
    def create
    #   @user = Foreigner.new(user_sign_up_params)
    #   if @user.save
    #     render json: @user.to_json
    #   else
    #     render json: @user.errors, status: :unprocessable_entity
    #   end
    end
    
    # GET /v1/users/new
    def new
      @user = Foreigner.new(user_sign_up_params)
        
      if @user.save
        render json: @user.to_json
      else
        render json: @user.errors, status: :unprocessable_entity
      end
      
    end
    
    # test용
    # GET /v1/users/foodname_test
    def foodname_test
      foodname = Array.new
      foodname << Foodglossary.last
      render json: foodname.to_json
    end
    
    private
      def user_sign_up_params
        # http://hello-stranger-dobeeisfree.c9users.io/v1/users/new?foreigners[name]=jubee
        params.require(:foreigners).permit(:name, :password, :for_taboo, :lang)
      end

  end
end