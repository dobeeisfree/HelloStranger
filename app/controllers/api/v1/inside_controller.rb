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
      @msg['user'] = '유저가 없어요!' if params[:user_id].present?
      @msg['store'] = '매장이 없어요!' if params[:store_id].present?
      @msg['menu'] = '메뉴가 없어요!' if params[:menu_id].present?
      @msg = nil if @msg
      render json: @msg.to_json, status: :not_found unless @msg.nil?


      # 해당 메뉴명를 조회
      @order_menu = Menu.find(params[:menu_id])
      @order_menu_name = Foodglossary.find(@order_menu.foodglossary_id)

      # 해당 유저가 어느나라사람인지 조회
      @where_are_you_from = Foreigner.find(params[:user_id]).lang
      # 해당 메뉴의 주문수 올리기
      case @where_are_you_from
        when 0
          @order_menu.count_kor = @order_menu.count_kor + 1
        when 1
          @order_menu.count_eng = @order_menu.count_eng + 1
        when 2
          @order_menu.count_jpn = @order_menu.count_jpn + 1
        else
          @order_menu.count_chn = @order_menu.count_chn + 1
      end
      @order_menu.save!


      # 주문한 기록을 생성
      my_food_diary = Diary.new
      my_food_diary.foreigner_id = params[:user_id]
      my_food_diary.store_id = params[:store_id]
      my_food_diary.menu_names_kor = @order_menu_name.kor
      my_food_diary.menu_names_eng = @order_menu_name.eng
      my_food_diary.menu_names_jpn = @order_menu_name.jpn
      my_food_diary.menu_names_chn = @order_menu_name.chn
      my_food_diary.save!

      render :nothing => true, status: :created

    end


  end
end