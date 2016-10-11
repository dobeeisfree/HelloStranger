class CreateMigration < ActiveRecord::Migration
  def self.up
    # insert schema.rb here

    add_foreign_key :menus,      :stores
    add_foreign_key :stores,     :owners
    add_foreign_key :reviews,    :menus
    add_foreign_key :reviews,    :foreigners

  end

  def self.down
    # drop all the tables if you really need
    # to support migration back to version 0
    drop_table :foreigners
    drop_table :menus
    drop_table :owners
    drop_table :reviews
    drop_table :stores

    drop_table :cookingmethods
    drop_table :foodglossaries
    drop_table :foodstuffs
    drop_table :tastes

  end
end
#http://stackoverflow.com/questions/4808437/how-to-generate-rails-migration-class-automatically-from-mysql-database-instance
