class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|

      t.belongs_to  :store
      t.string      :picture
      t.integer     :price

      t.boolean     :checked_menu
      t.boolean     :quick_menu

      ## db associations
      t.integer     :store_id
      t.integer     :foodglossary_id
      t.integer     :foodstuff_id
      t.integer     :foodstuff_id_2 # 두번째 포린키로 지정을 해줘야한다.
      t.integer     :taste_id
      t.integer     :cookingmethod_id

      # 주문수
      t.integer     :count_kor
      t.integer     :count_eng
      t.integer     :count_jpn
      t.integer     :count_chn

      # 선호도수(추천)
      t.integer     :like_kor
      t.integer     :like_eng
      t.integer     :like_jpn
      t.integer     :like_chn

      t.timestamps null: false
    end
  end

end
