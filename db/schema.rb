# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161117174128) do

  create_table "cookingmethods", force: :cascade do |t|
    t.string  "kor",     limit: 255
    t.string  "eng",     limit: 255
    t.string  "jpn",     limit: 255
    t.string  "chn",     limit: 255
    t.boolean "checked"
  end

  create_table "diaries", force: :cascade do |t|
    t.integer  "foreigner_id",   limit: 4
    t.integer  "store_id",       limit: 4
    t.string   "menu_names_kor", limit: 255
    t.string   "menu_names_eng", limit: 255
    t.string   "menu_names_jpn", limit: 255
    t.string   "menu_names_chn", limit: 255
    t.datetime "created_at",                 null: false
  end

  add_index "diaries", ["foreigner_id"], name: "fk_rails_33f01abd9f", using: :btree
  add_index "diaries", ["store_id"], name: "fk_rails_4322272df7", using: :btree

  create_table "foodglossaries", force: :cascade do |t|
    t.string  "kor",     limit: 255
    t.string  "eng",     limit: 255
    t.string  "jpn",     limit: 255
    t.string  "chn",     limit: 255
    t.boolean "checked"
  end

  create_table "foodstuffs", force: :cascade do |t|
    t.string  "kor",     limit: 255
    t.string  "eng",     limit: 255
    t.string  "jpn",     limit: 255
    t.string  "chn",     limit: 255
    t.boolean "checked"
  end

  create_table "foreigners", force: :cascade do |t|
    t.string  "name",      limit: 255
    t.string  "password",  limit: 255
    t.string  "keep",      limit: 255
    t.integer "for_taboo", limit: 4,   default: 0
    t.integer "lang",      limit: 4,   default: 0, null: false
  end

  create_table "menus", force: :cascade do |t|
    t.integer  "store_id",         limit: 4,                   null: false
    t.integer  "price",            limit: 4,   default: 2016
    t.boolean  "checked_menu",                 default: false
    t.boolean  "quick_menu",                   default: false
    t.integer  "foodglossary_id",  limit: 4,                   null: false
    t.integer  "foodstuff_id",     limit: 4,                   null: false
    t.integer  "foodstuff_id_2",   limit: 4,                   null: false
    t.integer  "taste_id",         limit: 4,                   null: false
    t.integer  "cookingmethod_id", limit: 4,                   null: false
    t.integer  "count_kor",        limit: 4,   default: 0
    t.integer  "count_eng",        limit: 4,   default: 0
    t.integer  "count_jpn",        limit: 4,   default: 0
    t.integer  "count_chn",        limit: 4,   default: 0
    t.integer  "like_kor",         limit: 4,   default: 0
    t.integer  "like_eng",         limit: 4,   default: 0
    t.integer  "like_jpn",         limit: 4,   default: 0
    t.integer  "like_chn",         limit: 4,   default: 0
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "food_picture",     limit: 255
  end

  add_index "menus", ["cookingmethod_id"], name: "fk_rails_49250363ed", using: :btree
  add_index "menus", ["foodglossary_id"], name: "fk_rails_37ad611b6a", using: :btree
  add_index "menus", ["foodstuff_id"], name: "fk_rails_7b67bed59f", using: :btree
  add_index "menus", ["foodstuff_id_2"], name: "menus_foodstuffs__fk", using: :btree
  add_index "menus", ["store_id"], name: "fk_rails_20b0ce4e50", using: :btree
  add_index "menus", ["taste_id"], name: "fk_rails_6ddead576a", using: :btree

  create_table "owners", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "name",                   limit: 255, default: "", null: false
    t.string   "contact_number",         limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "owners", ["email"], name: "index_owners_on_email", unique: true, using: :btree
  add_index "owners", ["reset_password_token"], name: "index_owners_on_reset_password_token", unique: true, using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "foreigner_id", limit: 4
    t.integer  "menu_id",      limit: 4
    t.string   "content",      limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "reviews", ["foreigner_id"], name: "fk_rails_402b8f23c3", using: :btree
  add_index "reviews", ["menu_id"], name: "fk_rails_be6d6ab568", using: :btree

  create_table "stores", force: :cascade do |t|
    t.integer  "owner_id",     limit: 4
    t.string   "name",         limit: 255
    t.string   "location",     limit: 255
    t.string   "beacon_id",    limit: 255
    t.string   "business_id",  limit: 255
    t.integer  "category",     limit: 4,   default: 0
    t.string   "open_time",    limit: 255
    t.string   "close_time",   limit: 255
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "main_picture", limit: 255
  end

  add_index "stores", ["owner_id"], name: "fk_rails_dabcef777e", using: :btree

  create_table "tastes", force: :cascade do |t|
    t.string  "kor",     limit: 255
    t.string  "eng",     limit: 255
    t.string  "jpn",     limit: 255
    t.string  "chn",     limit: 255
    t.boolean "checked"
  end

  add_foreign_key "diaries", "foreigners"
  add_foreign_key "diaries", "stores"
  add_foreign_key "menus", "cookingmethods"
  add_foreign_key "menus", "foodglossaries"
  add_foreign_key "menus", "foodstuffs"
  add_foreign_key "menus", "foodstuffs", column: "foodstuff_id_2", name: "menus_foodstuffs__fk"
  add_foreign_key "menus", "stores"
  add_foreign_key "menus", "tastes"
  add_foreign_key "reviews", "foreigners"
  add_foreign_key "reviews", "menus"
  add_foreign_key "stores", "owners"
end
