class CreateCookingmethods < ActiveRecord::Migration
  def change
    create_table :cookingmethods do |t|

      t.string    :kor
      t.string    :eng
      t.string    :jpn
      t.string    :chn
      t.boolean   :checked


      t.timestamps null: false
    end
  end
end
