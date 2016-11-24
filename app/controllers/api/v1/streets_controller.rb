module Api::V1
  class StreetsController < ApiController


    # GET /v1/streets/around_menus
    def around_menus
      # params
      # => beacon_id, category

      # 파라미터 값 유효 검사
      render json: '매장을 찾을 수 없네요!', status: :not_found if params[:beacon_id].present?
      render json: '카테고리가 없어요!', status: :not_found if params[:category].present?

      # 해당 카테고리의 매장을 비콘아이디로 찾는다.
      @store = category(params[:category]).find_by(beacon_id: params[:beacon_id])
      @quick_menu_pan = '퀵 메뉴판 정보를 가져올 수 없습니다' if @store.nil?
      @quick_menu_pan = @store.menu.find_by(quick_menu: true) if @store
      render json: @quick_menu_pan.to_json, status: :ok

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