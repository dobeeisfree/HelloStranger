class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|

      t.string      :name
      t.string      :location
      t.string      :beacon_id
      t.string      :business_id
			t.string      :main_picture

      t.integer     :category

      t.datetime    :open_time
      t.datetime    :close_time

      t.timestamps  null: false
    end
  end
end
