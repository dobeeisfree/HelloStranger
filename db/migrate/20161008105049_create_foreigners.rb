class CreateForeigners < ActiveRecord::Migration
  def change
    create_table :foreigners do |t|

      t.string   :name
      t.string   :password

      t.integer  :lang       # 0 ~ 3 (Kor, Eng, Chin)
      t.integer  :keep       # store.id를 저장한다
      t.integer  :for_taboo  # 0 ~ 7 (Skip, Muslim , ... )

      t.timestamps null: false
    end
  end
end
