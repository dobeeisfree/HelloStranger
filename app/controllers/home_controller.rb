class HomeController < ApplicationController

  def index
    if current_owner && check_owner
      puts "저런~~~~~~~~"
      flash[:alet] = "매장을 꼭 등록해주세요!"
      redirect_to owners_confirm_path
    end
  end

  private
  # 오너는 반드시 매장 하나를 가지고 있어야한다.
  # 유효성 검사
    def check_owner
      if current_owner.stores.count == 0
        return true
      end
    end

end
