class CreateForeigners < ActiveRecord::Migration
  def change
    create_table :foreigners do |t|

      t.string   :name
      t.string   :password

      # store.id를 저장한다
      t.string   :keep, :default => ""

      # 0 ~ 7 (Skip, Muslim , ... )
      t.integer  :for_taboo, :default => 0
      # 0 ~ 3 (Kor, Eng, Jpn, Chin)
      t.integer  :lang, :null => false, :default => 0

    end
  end
end
