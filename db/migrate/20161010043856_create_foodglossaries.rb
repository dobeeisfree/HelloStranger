class CreateFoodglossaries < ActiveRecord::Migration
  def change
    create_table :foodglossaries do |t|

      t.string    :kor
      t.string    :eng
      t.string    :jpn
      t.string    :chn
      t.boolean   :checked

      t.timestamps null: true
    end
  end
end
