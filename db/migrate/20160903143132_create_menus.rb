class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|

      t.string      :picture
      t.string      :name
      t.integer     :price

      t.boolean     :checked_menu
      t.boolean     :recommended_menu

      ## db associations
      t.integer     :store_id
      t.integer     :foodglossary_id
      t.integer     :foodstuff_id
      t.integer     :taste_id
      t.integer     :cookingmethod_id

      t.timestamps null: false
    end
  end

end
