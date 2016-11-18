class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|

      t.belongs_to  :store
      # t.string      :picture
      t.integer     :price , :default => 2016

      t.boolean     :checked_menu, :default => false
      t.boolean     :quick_menu,   :default => false

      ## db associations
      t.integer     :store_id
      t.integer     :foodglossary_id
      t.integer     :foodstuff_id
      t.integer     :foodstuff_id_2
      t.integer     :taste_id
      t.integer     :cookingmethod_id

      # 주문수
      t.integer     :count_kor , :default => 0
      t.integer     :count_eng , :default => 0
      t.integer     :count_jpn , :default => 0
      t.integer     :count_chn , :default => 0

      # 선호도수(추천)
      t.integer     :like_kor , :default => 0
      t.integer     :like_eng , :default => 0
      t.integer     :like_jpn , :default => 0
      t.integer     :like_chn , :default => 0

      t.timestamps null: false
    end
  end

end
