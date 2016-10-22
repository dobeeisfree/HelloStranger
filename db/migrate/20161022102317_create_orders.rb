class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|

      t.integer     :menu_id
      t.integer     :foreigner_id
      t.integer     :store_id
      t.integer     :quantity

      t.timestamps null: false
    end
  end
end
