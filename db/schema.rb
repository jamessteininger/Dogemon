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

ActiveRecord::Schema.define(version: 20141029001942) do

  create_table "aenemies", force: true do |t|
    t.integer  "health"
    t.integer  "attack"
    t.integer  "defense"
    t.string   "element"
    t.integer  "coin"
    t.integer  "experience"
    t.string   "name"
    t.string   "description"
    t.string   "imageurl"
    t.integer  "enemy_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "battle_id"
  end

  create_table "battle_logs", force: true do |t|
    t.string   "description"
    t.string   "type"
    t.integer  "battle_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pvp_battle_id"
    t.integer  "user_id"
  end

  create_table "battle_moves", force: true do |t|
    t.integer  "battle_id"
    t.integer  "attacker_id"
    t.integer  "defender_id"
    t.string   "move_type"
    t.integer  "move_amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "battles", force: true do |t|
    t.integer  "user_id"
    t.integer  "enemy_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "aenemy_id"
  end

  create_table "colusseums", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enemies", force: true do |t|
    t.integer  "health"
    t.integer  "attack"
    t.integer  "defense"
    t.string   "element"
    t.integer  "coin"
    t.integer  "experience"
    t.string   "name"
    t.string   "description"
    t.string   "imageurl"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "equipment", force: true do |t|
    t.integer  "pet_id"
    t.integer  "item_inst_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sale_id"
  end

  create_table "item_insts", force: true do |t|
    t.integer  "item_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pet_id"
  end

  create_table "items", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "worth"
    t.string   "imageurl"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "element"
    t.string   "category"
    t.integer  "attack"
    t.integer  "magic"
    t.integer  "turns"
    t.float    "boost"
    t.integer  "creator_id"
    t.integer  "downloads"
  end

  create_table "logs", force: true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "market_item_votes", force: true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pets", force: true do |t|
    t.string   "imageurl"
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "health"
    t.integer  "magic"
    t.integer  "pvp_battle_id"
    t.string   "element"
  end

  create_table "pvp_battles", force: true do |t|
    t.integer  "user_id"
    t.integer  "other_id"
    t.string   "battle_state"
    t.boolean  "user1_turn"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pet1_id"
    t.integer  "pet2_id"
    t.integer  "winner_id"
  end

  create_table "sales", force: true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "equipment_id"
  end

  create_table "towns", force: true do |t|
    t.string   "image_url"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "coin"
    t.string   "nickname"
    t.integer  "town_id"
    t.text     "bio"
    t.string   "dogetag"
    t.string   "imageurl"
    t.integer  "health"
    t.integer  "total_health"
    t.integer  "magic"
    t.integer  "attack"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "votable_items", force: true do |t|
    t.integer  "upvotes"
    t.integer  "downvotes"
    t.integer  "sumvotes"
    t.string   "imageurl"
    t.string   "name"
    t.text     "description"
    t.float    "worth"
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
