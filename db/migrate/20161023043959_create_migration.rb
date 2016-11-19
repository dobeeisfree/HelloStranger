class CreateMigration < ActiveRecord::Migration
  def self.up
    # # insert schema.rb here
    #
    # add_foreign_key :menus,      :stores
    # add_foreign_key :menus,      :foodglossaries
    # add_foreign_key :menus,      :foodstuffs
    # add_foreign_key :menus,      :tastes
    # add_foreign_key :menus,      :cookingmethods
    #
    #
    # add_foreign_key :stores,     :owners
    # add_foreign_key :reviews,    :menus
    # add_foreign_key :reviews,    :foreigners
    #
    # add_foreign_key :diaries,    :stores
    # add_foreign_key :diaries,    :foreigners


    # 번역테이블의 csv파일을 직접 로드
    execute "LOAD DATA LOCAL INFILE '#{Rails.root}/db/local-sql/foodnames.csv' INTO TABLE foodglossaries FIELDS TERMINATED BY ',';"
    # foodstuff_id_2를 두번째 포린키로 지정
    # execute "ALTER TABLE helloStranger_development.menus ADD CONSTRAINT menus_foodstuffs__fk FOREIGN KEY (foodstuff_id_2) REFERENCES foodstuffs (id);"

  end

  def self.down
    # drop all the tables if you really need
    # to support migration back to version 0
    drop_table :foreigners
    drop_table :menus
    drop_table :owners
    drop_table :reviews
    drop_table :stores
    drop_table :diaries

    drop_table :cookingmethods
    drop_table :foodglossaries
    drop_table :foodstuffs
    drop_table :tastes

  end
end
#http://stackoverflow.com/questions/4808437/how-to-generate-rails-migration-class-automatically-from-mysql-database-instance
