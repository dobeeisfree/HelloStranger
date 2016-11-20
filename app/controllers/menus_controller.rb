class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_owner!, only: [:index]

  # GET /menus
  # GET /menus.json
  def index

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
      @menus = Menu.where(@store.id)
      puts @menus
    else
      # 어떤 매장을 선택했을 때
      @store = params[:current_store]
      @menus = Menu.where(params[:current_store])
      puts @menus
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
  end

  # POST /menus
  # POST /menus.json
  def create
    @menu = Menu.new(menu_params)

    respond_to do |format|
      if @menu.save
        format.html { redirect_to menus_path, notice: 'Menu was successfully created.' }
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
        format.html { redirect_to @menu, notice: 'Menu was successfully updated.' }
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
      format.html { redirect_to menus_url, notice: 'Menu was successfully destroyed.' }
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
      params.require(:menu).permit(:store_id, :food_picture, :price, :foodstuff_id, :foodstuff_id_2, :foodglossary_id, :cookingmethod_id, :taste_id)
    end
end
