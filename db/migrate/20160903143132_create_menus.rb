class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|

      t.string      :picture
      t.string      :name

      t.integer     :tag_taste
      t.integer     :tag_foodstuff
      t.integer     :tag_cookingmethod
      t.integer     :price

      t.boolean     :checked_menu
      t.boolean     :recommended_menu

      ## db associations
      t.integer     :store_id

      t.timestamps null: false
    end
  end

end
