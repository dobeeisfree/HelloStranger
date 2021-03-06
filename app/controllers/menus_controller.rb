class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_owner!, only: [:index]

  # GET /menus
  # GET /menus.json
  def index
    @menu = Menu.new

    if current_owner.stores.empty?
      flash[:alert] = "매장을 등록한 후, 메뉴판을 등록해주세요!"
      redirect_to new_store_path
    end
    # 오너에게만 보일 것들
    # 오너의 매장
    @stores = Owner.find(current_owner.id).stores

    # 오너가 등록한 메뉴
    # 매장당 보여야한다
    if params[:current_store].to_s.blank?
      # 디폴트 일 때
      @store = @stores.first
      @menus = Menu.where(store_id: @store.id)
      puts @menus.ids
    else
      # 어떤 매장을 선택했을 때
      @store = @stores.find(params[:current_store])
      @menus = Menu.where(store_id: params[:current_store])
      puts @menus.ids
    end
  end

  # GET /menus/1
  # GET /menus/1.json
  def show
  end

  # GET /menus/new
  def new
    @menu = Menu.new
  end

  # GET /menus/1/edit
  def edit
    @stores = Owner.find(current_owner.id).stores
  end

  # POST /menus
  # POST /menus.json
  def create

    # if params[:picture]
    # file = params[:picture]
    # s3 = FoodUploader.new
    # s3.store!(file)
    # end

    @menu = Menu.new(menu_params)
    # @menu.picture = s3.url

    respond_to do |format|
      if @menu.save
        format.html { redirect_to menus_path, notice: '메뉴가 성공적으로 등록되었습니다.' }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { redirect_to menus_path }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menus/1
  # PATCH/PUT /menus/1.json
  def update
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to board_path, notice: '메뉴가 성공적으로 업데이트 되었습니다.' }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to board_path, notice: '메뉴가 성공적으로 삭제되었습니다.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_params
      params.require(:menu).permit(:store_id, :picture, :price, :foodstuff_id, :foodstuff_id_2, :foodglossary_id, :cookingmethod_id, :taste_id)
    end
end
