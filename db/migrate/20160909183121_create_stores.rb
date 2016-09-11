class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string   :name
      t.string   :location
      t.integer  :category
      t.string   :beacon_id
      t.string   :business_id
      t.datetime :open_time
      t.datetime :close_time

      t.timestamps null: false
    end
  end
end
