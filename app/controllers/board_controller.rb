class BoardController < ApplicationController
  before_action :set_stores

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

    @max_menu = @menus.count

    # 주문수 별
    @cnt_jpn = @menus.sorted_by &:count_jpn
    @cnt_chn = @menus.sorted_by &:count_chn
    @cnt_kor = @menus.sorted_by &:count_kor
    @cnt_eng = @menus.sorted_by &:count_eng

    # 선호도 별
    @jpn_like = @menus.sorted_by &:like_jpn
    @chn_like = @menus.sorted_by &:like_chn
    @kor_like = @menus.sorted_by &:like_kor
    @eng_like = @menus.sorted_by &:like_eng

  end

  private
    def set_stores
      @stores = Owner.find(current_owner.id).stores.all
    end

end
