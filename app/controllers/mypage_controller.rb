class MypageController < ApplicationController

  # 수정이 가능해야한다.
  def account
    @owner = Owner.find_by(id: current_owner.id)
  end

  def manage_store
  end
end
