module Api::V1
  class InsideController < ApiController


    # GET /v1/inside/order_sheet
    def order_sheet
      # 사용자가 메뉴를 주문하였을 때,
      # 해당 메뉴의 주문수는 카운트 되야하며,
      # 사용자의 푸드 다이어리 기록에 저장되어야한다.

      # params
      # => user_id, store_id, menu_id

      # 파라미터값 검사
      @msg = Hash.new
      @msg['user'] = '존재하지 않아요!' if Foreigner.last.id < params[:user_id].to_i || Foreigner.first.id > params[:user_id].to_i
      @msg['store'] = '존재하지 않아요!' if Store.last.id < params[:store_id].to_i || Store.first.id > params[:store_id].to_i
      @msg['menu'] = '존재하지 않아요!' if Menu.last.id < params[:menu_id].to_i || Menu.first.id > params[:menu_id].to_i
      @msg = nil if @msg == {}
      render json: @msg.to_json, status: :not_found if @msg


      if @msg.nil?
        # 해당 메뉴명를 조회
        @order_menu = Menu.find(params[:menu_id])
        @order_menu_name = Foodglossary.find(@order_menu.foodglossary_id)

        # 해당 유저가 어느나라사람인지 조회
        @where_are_you_from = Foreigner.find(params[:user_id]).lang

        @confirm_msg = Hash.new
        # 해당 메뉴의 주문수 올리기
        case @where_are_you_from
          when 0
            @order_menu.count_kor = @order_menu.count_kor + 1
          when 1
            @order_menu.count_eng = @order_menu.count_eng + 1
          when 2
            @order_menu.count_jpn = @order_menu.count_jpn + 1
          when 3
            @order_menu.count_chn = @order_menu.count_chn + 1
        end
        @confirm_msg['count'] = '주문수가 올라갔습니다'if @order_menu.save!


        # 주문한 기록을 생성
        my_food_diary = Diary.new
        my_food_diary.foreigner_id = params[:user_id]
        my_food_diary.store_id = params[:store_id]
        my_food_diary.menu_names_kor = @order_menu_name.kor
        my_food_diary.menu_names_eng = @order_menu_name.eng
        my_food_diary.menu_names_jpn = @order_menu_name.jpn
        my_food_diary.menu_names_chn = @order_menu_name.chn
        @confirm_msg['diary created'] = '주문 기록이 남겨졌습니다' if my_food_diary.save!

        render json: @confirm_msg.to_json, status: :created

      end

    end


  end
end