class MypageController < ApplicationController

  # 수정이 가능해야한다.
  def account
    @owner = Owner.find(current_owner.id)
  end

  def manage_store
    @stores = Owner.find(current_owner.id).stores
  end
end
