class SeverController < ApplicationController
    
    # test 용
    def foodname_test
        foodname = Array.new
        foodname << Foodglossary.last
        render json: foodname.to_json
        # respond_to do |format|
        #     if foodname
        #         format.json { render foodname.to_json }
        #     else
        #         format.json { render foodname.errors, status: :unprocessable_entity }
        #     end
        # end
    end
    
    # 회원가입 시, 유저 정보 생성
    def user_sign_up
        # INPUT : 이름, 패스워드, 타부, 랭귀지
        user = Foreigner.new(user_sign_up_params)
        
        if user.save
            render json: user.to_json
        else
            render json: user.errors, status: :unprocessable_entity
        end
        
    end
    
    private
        def user_sign_up_params
            params.require(:foreigner).permit(:name, :password, :for_taboo, :lang)
        end
end
