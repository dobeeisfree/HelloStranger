class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string  :picture

      t.integer :tag_taste
      t.integer :tag_foodstuff
      t.integer :tag_cookingmethod

      t.integer :price
      t.string  :name
      t.boolean :recommended_menu

      t.timestamps null: false
    end
  end
end
