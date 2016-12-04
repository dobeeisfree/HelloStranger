class BoardController < ApplicationController
  before_action :set_stores
  before_action :authenticate_owner!

  def quick

    @menus = @stores.first.menu if params[:store_id].to_s.blank?
    @menus = @stores.find(params[:store_id]).menu if params[:store_id]

    cnt = 0
    @custom_err_msg = nil
    @menus.each do |m|
      cnt = cnt + 1 if m.quick_menu == true
    end

    @custom_err_msg = "현재 퀵메뉴판이 2개입니다." if cnt == 2 && params[:set_quick]


    if params[:set_quick] && cnt <= 1
      @menu = @menus.find(params[:set_quick])
      @menu.set_quick(params[:set_quick]) if @menu.quick_menu == false
    end

    if cnt >= 2 && params[:set_quick]
      @menu = @menus.find(params[:set_quick])
      @menu.set_quick(params[:set_quick]) if @menu.quick_menu == true
    end

  end

  def report

    # TODO
    @menus = @stores.first.menu if params[:store_id].to_s.blank?
    @menus = @stores.find(params[:store_id]).menu if params[:store_id]

    @menus_cnt = @menus.count

    # 주문수 별
    @menu_select_lang = Array.new
    @cnt_jpn = @menus.order(:count_jpn)
    @cnt_chn = @menus.order(:count_chn)
    @cnt_kor = @menus.order(:count_kor)
    @cnt_eng = @menus.order(:count_eng)
    @menu_select_lang = [@cnt_eng, @cnt_kor, @cnt_chn, @cnt_jpn]

    # 선호도 별
    @menu_select_like = Array.new
    @jpn_like = @menus.order(:like_jpn)
    @chn_like = @menus.order(:like_chn)
    @kor_like = @menus.order(:like_kor)
    @eng_like = @menus.order(:like_eng)
    @menu_select_like = [@eng_like, @kor_like, @chn_like, @jpn_like]

  end

  private
    def set_stores
      @stores = Owner.find(current_owner.id).stores.all if current_owner
    end

end
