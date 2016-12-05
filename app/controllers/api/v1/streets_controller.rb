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
      @quick_menu_pan = nil if @store.nil?
      render json: '퀵 메뉴판 정보를 가져올 수 없습니다'.to_json, status: :not_found if @quick_menu_pan.nil?
      @quick_menu_pan = @store.menu.find_by(quick_menu: true) if @store
      render json: @quick_menu_pan.to_json, status: :ok if @quick_menu_pan

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

      if @beacon_dna
        @beacon_list = @beacon_dna.split('/')
        @stores = Array.new
        @beacon_list.each do |b|
          @stores << Store.find_by(beacon_id: b)
        end
        
        # puts @beacon_list

        # 중복검사와 nil검사
        @stores.delete(nil)
        @stores.uniq!

        # 각 store마다 메뉴를 보낸다.
        @menu_list = Hash.new
        @stores.each do |m|
          @menu_list['store_id'] = m.id
          m.menu.each do |mm|
            @menu_list['menu'] = m.menu if mm.quick_menu == true
          end
        end

        # 안드로이드에서 중복된 beacon_dna를 업데이트 하고 싶을 때
        # @mene_list['uniq_beacon_dna'] = @beacon_list.uniq!

        render json: @menu_list.to_json, status: :ok if @menu_list != {}
        render json: '잘못된 요청입니다'.to_json, status: :not_found if @menu_list == {}
      end

    end
    
    # GET /v1/streets/get
    def get_here_store
      # params
      # => store_id
      @store = Store.find(params[:store_id])
      render json: @store.to_json
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