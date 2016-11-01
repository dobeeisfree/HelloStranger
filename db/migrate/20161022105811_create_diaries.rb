class CreateDiaries < ActiveRecord::Migration
  def change
    create_table :diaries do |t|

      t.integer     :foreigner_id
      t.integer     :store_id

      # 메뉴이름
      t.string      :menu_names_kor
      t.string      :menu_names_eng
      t.string      :menu_names_jpn
      t.string      :menu_names_chn

      t.datetime    :created_at , null: false
    end
  end
end
