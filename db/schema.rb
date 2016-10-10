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

ActiveRecord::Schema.define(version: 20161010043959) do

  create_table "cookingmethods", force: :cascade do |t|
    t.string   "kor",        limit: 255
    t.string   "eng",        limit: 255
    t.string   "jpn",        limit: 255
    t.string   "chn",        limit: 255
    t.boolean  "checked"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "foodglossaries", force: :cascade do |t|
    t.string   "kor",        limit: 255
    t.string   "eng",        limit: 255
    t.string   "jpn",        limit: 255
    t.string   "chn",        limit: 255
    t.boolean  "checked"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "foodstuffs", force: :cascade do |t|
    t.string   "kor",        limit: 255
    t.string   "eng",        limit: 255
    t.string   "jpn",        limit: 255
    t.string   "chn",        limit: 255
    t.boolean  "checked"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "foreigners", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "password",   limit: 255
    t.integer  "lang",       limit: 4
    t.integer  "keep",       limit: 4
    t.integer  "for_taboo",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "rev_id",     limit: 4,   null: false
  end

  add_index "foreigners", ["rev_id"], name: "foreigners_reviews__fk", using: :btree

  create_table "menus", force: :cascade do |t|
    t.string   "picture",           limit: 255
    t.string   "kor_name",          limit: 255
    t.integer  "tag_taste",         limit: 4
    t.integer  "tag_foodstuff",     limit: 4
    t.integer  "tag_cookingmethod", limit: 4
    t.integer  "price",             limit: 4
    t.boolean  "checked_menu"
    t.boolean  "quick_menu"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "rev_id",            limit: 4
    t.integer  "sto_id",            limit: 4
    t.string   "eng_name",          limit: 255, null: false
    t.string   "jpn_name",          limit: 255, null: false
    t.string   "chn_name",          limit: 255, null: false
  end

  add_index "menus", ["rev_id"], name: "review_id", using: :btree
  add_index "menus", ["sto_id"], name: "store_id", using: :btree

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
    t.integer  "sto_id",                 limit: 4
  end

  add_index "owners", ["email"], name: "index_owners_on_email", unique: true, using: :btree
  add_index "owners", ["reset_password_token"], name: "index_owners_on_reset_password_token", unique: true, using: :btree
  add_index "owners", ["sto_id"], name: "store_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.boolean  "is_eval"
    t.string   "content",     limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "men_name",    limit: 255, null: false
    t.string   "men_picture", limit: 255, null: false
    t.integer  "men_id",      limit: 4,   null: false
    t.integer  "for_id",      limit: 4,   null: false
  end

  add_index "reviews", ["for_id"], name: "for_id", using: :btree
  add_index "reviews", ["men_id"], name: "men_id", using: :btree

  create_table "stores", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "location",     limit: 255
    t.string   "beacon_id",    limit: 255
    t.string   "business_id",  limit: 255
    t.string   "main_picture", limit: 255
    t.integer  "category",     limit: 4
    t.datetime "open_time"
    t.datetime "close_time"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "rev_id",       limit: 4
    t.integer  "men_id",       limit: 4
  end

  add_index "stores", ["men_id"], name: "men_id", using: :btree
  add_index "stores", ["rev_id"], name: "rev_id", using: :btree

  create_table "tastes", force: :cascade do |t|
    t.string   "kor",        limit: 255
    t.string   "eng",        limit: 255
    t.string   "jpn",        limit: 255
    t.string   "chn",        limit: 255
    t.boolean  "checked"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "foreigners", "reviews", column: "rev_id", name: "foreigners_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "menus", "reviews", column: "rev_id", name: "menus_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "menus", "stores", column: "sto_id", name: "menus_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "owners", "stores", column: "sto_id", name: "owners_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "reviews", "foreigners", column: "for_id", name: "reviews_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "reviews", "menus", column: "men_id", name: "reviews_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "stores", "menus", column: "men_id", name: "stores_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "stores", "reviews", column: "rev_id", name: "stores_ibfk_1", on_update: :cascade, on_delete: :cascade
end
