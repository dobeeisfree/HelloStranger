class Menu < ActiveRecord::Base
  mount_uploader :food_picture, MenuImageUploader

  validates_presence_of :store_id

  # db Associations
  belongs_to  :store
  has_many  :cookingmethod
  has_many  :foodglossary
  has_many  :taste
  has_many  :foodstuff

  has_many    :review

  def set_quick(id)
    @menu = Menu.find(id)
    # 토글
    if @menu.quick_menu == false
      @menu.update(quick_menu: true)
    else
      @menu.update(quick_menu: false)
    end

    @menu.save
  end
end
