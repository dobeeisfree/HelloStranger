class CreateCookingmethods < ActiveRecord::Migration
  def change
    create_table :cookingmethods do |t|

      t.string    :kor
      t.string    :eng
      t.string    :jpn
      t.string    :chn
      t.boolean   :checked

    end
  end
end
