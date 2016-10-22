class CreateDiaries < ActiveRecord::Migration
  def change
    create_table :diaries do |t|

      t.integer     :menu_id
      t.integer     :foreigner_id
      t.integer     :store_id
      t.timestamps null: false
    end
  end
end
