class BoardController < ApplicationController
  before_action :set_stores

  def quick
  end

  def report
  end

  private
    def set_stores
      @stores = Owner.find(current_owner.id).stores.all
    end

end
