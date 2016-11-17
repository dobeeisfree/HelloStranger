module Api::V1
  class TransferController < ApplicationController

  # semantic-ui API local search 구현.
  # for menus.coffee
  
    def menu_name
    # foodglossary
  
      # 메뉴 파라미터, 유효성 검사
      if params.has_key?(:q)
        @food_glossary_kor = Hash.new
        @food_glossary_kor["results"] = Array.new
        Foodglossary.all.reverse.each do |f|
          if f.kor.include? params[:q]
            @food_glossary_kor["results"].push("id" => f.id, "kor" => f.kor)
          end
        end
        puts @food_glossary_kor
        render json: @food_glossary_kor
      # 이상한 파라미터가 들어올 경우
      else
        error_for_params
      end
  
    end
  
    def taste
    end
  
    def foodstuff
    end
  
    private
      def error_for_params
        render inline: "<br><center>어머 잘못된 요청이군요!<br><%=link_to '홈으로 갈래요', root_path %></center>"
      end
  end
  
end