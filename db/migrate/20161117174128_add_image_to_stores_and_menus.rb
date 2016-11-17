class AddImageToStoresAndMenus < ActiveRecord::Migration

  # 이미지 업로드를 적용할 모델을
  # 업로더에 마운트
  def change
		add_column :stores, :main_picture, :string
		add_column :menus, 	:food_picture, :string
  end
end
