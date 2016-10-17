class CreateTastes < ActiveRecord::Migration
  def change
    create_table :tastes do |t|

      t.string    :kor
      t.string    :eng
      t.string    :jpn
      t.string    :chn
      t.boolean   :checked
      
    end
  end
end
