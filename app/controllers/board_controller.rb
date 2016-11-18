class BoardController < ApplicationController
  before_action :set_stores

  def quick
    if params[:store_id].to_s.blank?
      puts "디폴트"
      @menus = @stores.first.menus
    else
      @menus = @stores.find(params[:store_id]).menus
    end
  end

  def report
  end

  private
    def set_stores
      @stores = Owner.find(current_owner.id).stores.all
    end

end
