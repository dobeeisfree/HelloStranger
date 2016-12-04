class AddPictureToMenusAndStores < ActiveRecord::Migration
  def change
    add_column :menus,  :picture, :string
    add_column :stores, :main_picture, :string
  end
end
