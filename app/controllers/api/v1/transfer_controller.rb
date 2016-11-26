module Api::V1
  class TransferController < ApplicationController

    # GET /v1/transfer/menu_pan
    def menu_pan
      # 해당 메뉴를 원하는 언어로 가져온다

      # params
      # => menu_id, lang_id

      # 파라미터 값 유효 검사
      @msg = Hash.new
      @msg['menu_id'] = '메뉴가 없어요!' if params[:menu_id].to_i >= Menu.last.id || Menu.first.id >= params[:menu_id].to_i
      @msg['lang_id'] = '언어를 지정해주세요!' if params[:lang_id].to_i > 3
      @msg = nil if @msg == {}
      render json: @msg.to_json, status: :not_found if @msg


      if @msg.nil?
        # 해당 메뉴를 찾아서 검사
        @menu = Menu.find(params[:menu_id]) if Menu.last.id >= params[:menu_id].to_i
        render json: '메뉴가 없어요'.to_json, status: :not_found if @menu.nil?
      end

      if @menu
        # 번역된 것만 담아 보낸다.

        @menu_pan = nil if @menu_pan
        @menu_pan = Hash.new
        case params['lang_id'].to_i
          when 0
            @menu_pan['foodname'] = Foodglossary.find(@menu.foodglossary_id).kor
            @menu_pan['foodstuff_1'] = Foodstuff.find(@menu.foodstuff_id).kor
            @menu_pan['foodstuff_2'] = Foodstuff.find(@menu.foodstuff_id_2).kor
            @menu_pan['taste'] = Taste.find(@menu.taste_id).kor
            @menu_pan['cookingmethod'] = Cookingmethod.find(@menu.taste_id).kor
          when 1
            @menu_pan['foodname'] = Foodglossary.find(@menu.foodglossary_id).eng
            @menu_pan['foodstuff_1'] = Foodstuff.find(@menu.foodstuff_id).eng
            @menu_pan['foodstuff_2'] = Foodstuff.find(@menu.foodstuff_id_2).eng
            @menu_pan['taste'] = Taste.find(@menu.taste_id).eng
            @menu_pan['cookingmethod'] = Cookingmethod.find(@menu.taste_id).eng
          when 2
            @menu_pan['foodname'] = Foodglossary.find(@menu.foodglossary_id).jpn
            @menu_pan['foodstuff_1'] = Foodstuff.find(@menu.foodstuff_id).jpn
            @menu_pan['foodstuff_2'] = Foodstuff.find(@menu.foodstuff_id_2).jpn
            @menu_pan['taste'] = Taste.find(@menu.taste_id).jpn
            @menu_pan['cookingmethod'] = Cookingmethod.find(@menu.taste_id).jpn
          else
            @menu_pan['foodname'] = Foodglossary.find(@menu.foodglossary_id).chn
            @menu_pan['foodstuff_1'] = Foodstuff.find(@menu.foodstuff_id).chn
            @menu_pan['foodstuff_2'] = Foodstuff.find(@menu.foodstuff_id_2).chn
            @menu_pan['taste'] = Taste.find(@menu.taste_id).chn
            @menu_pan['cookingmethod'] = Cookingmethod.find(@menu.taste_id).chn
        end

        render json: @menu_pan.to_json, status: :ok

      end

    end

  end
end
