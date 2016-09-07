class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :picture
      t.integer :price
      t.string :name
      t.boolean :recommended_menu

      t.timestamps null: false
    end
  end
end
