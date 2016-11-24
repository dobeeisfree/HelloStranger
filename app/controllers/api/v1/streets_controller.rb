module Api::V1
  class StreetsController < ApiController


    # GET /v1/streets/manu_pan
    def manu_pan
      # 퀵 메뉴판 하나만 가져올 때 (테스트용)
      # params
      # => beacon_id, category

      # 파라미터 값 유효 검사
      @msg = Hash.new
      @msg['beacon_id'] = '비콘신호가 발견되지 않아요!' if params[:beacon_id].present?
      @msg['category'] = '카테고리가 없어요!' if params[:category].present?
      @msg = nil if @msg
      render json: @msg.to_json, status: :not_found unless @msg.nil?

      # 해당 카테고리의 매장을 비콘아이디로 찾는다.
      @store = category(params[:category]).find_by(beacon_id: params[:beacon_id])
      @quick_menu_pan = '퀵 메뉴판 정보를 가져올 수 없습니다' if @store.nil?
      @quick_menu_pan = @store.menu.find_by(quick_menu: true) if @store
      render json: @quick_menu_pan.to_json, status: :ok

    end


    # GET /v1/streets/all_around_menus
    def all_around_menus
      # 비콘신호가 잡히는
      # 매장들을 전부 가져온다.

      # params
      # => beacon_dna. (beacon_id가 담긴 String)
      # String 의 구분자는 '/'
      # 예 : "23423423/123123/123123/12324234123123"
      @beacon_dna = params[:beacon_dna] if params[:beacon_dna].present?
      render :nothing => true, status: :not_found if @beacon_dna.nil?


      @beacon_list = @beacon_dna.split('/')
      @stores = Array.new
      @beacon_list.each do |b|
        @stores << Store.find_by(beacon_id: b.to_i)
      end

      render json: @stores.to_json, status: :ok

    end


    private
    def category(num)
      # params
      # num => category 번호를 의미한다.
      # 해당 카테고리를 가진 매장들은 담는다.
      @stores = nil
      @stores = Store.where(category: num) if num.present?
    end

  end
end