class BoardController < ApplicationController
  before_action :set_stores

  def quick
    if params[:store_id].to_s.blank?
      puts "디폴트"
      @menus = @stores.first.menu
    else
      @menus = @stores.find(params[:store_id]).menu
    end

    cnt = 0
    @custom_err_msg = ""
    @menus.each do |m|
      if m.quick_menu == true
        cnt = cnt + 1
      end
    end

    if cnt == 2 && params[:set_quick]
      @custom_err_msg = "현재 퀵메뉴판이 2개입니다."
    end

    if params[:set_quick]
      @menu = @menus.find(params[:set_quick])
      @menu.set_quick(params[:set_quick])
    end
  end

  def report
  end

  private
    def set_stores
      @stores = Owner.find(current_owner.id).stores.all
    end

end
