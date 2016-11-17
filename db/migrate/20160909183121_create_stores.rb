class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|

      ## db associations
      #t.belongs_to  :owner
      t.belongs_to  :owner

      t.string      :name
      t.string      :location
      t.string      :beacon_id
      t.string      :business_id
			# t.string      :main_picture

      t.integer     :category , :default => 0

      t.string      :open_time
      t.string      :close_time

      t.timestamps  null: false
    end
  end
end
