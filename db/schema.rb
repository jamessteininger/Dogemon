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

ActiveRecord::Schema.define(version: 20141215234654) do

  create_table "admin_users", force: true do |t|
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
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

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

# Could not dump table "battle_logs" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "battle_moves", force: true do |t|
    t.integer  "battle_id"
    t.integer  "attacker_id"
    t.integer  "defender_id"
    t.string   "move_type"
    t.integer  "move_amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

# Could not dump table "battles" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "blogs", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "feedbacks", force: true do |t|
    t.integer  "user_id"
    t.string   "feedback_type"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forem_categories", force: true do |t|
    t.string   "name",                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.integer  "position",   default: 0
  end

  add_index "forem_categories", ["slug"], name: "index_forem_categories_on_slug", unique: true

  create_table "forem_forums", force: true do |t|
    t.string  "name"
    t.text    "description"
    t.integer "category_id"
    t.integer "views_count", default: 0
    t.string  "slug"
    t.integer "position",    default: 0
  end

  add_index "forem_forums", ["slug"], name: "index_forem_forums_on_slug", unique: true

  create_table "forem_groups", force: true do |t|
    t.string "name"
  end

  add_index "forem_groups", ["name"], name: "index_forem_groups_on_name"

  create_table "forem_memberships", force: true do |t|
    t.integer "group_id"
    t.integer "member_id"
  end

  add_index "forem_memberships", ["group_id"], name: "index_forem_memberships_on_group_id"

  create_table "forem_moderator_groups", force: true do |t|
    t.integer "forum_id"
    t.integer "group_id"
  end

  add_index "forem_moderator_groups", ["forum_id"], name: "index_forem_moderator_groups_on_forum_id"

  create_table "forem_posts", force: true do |t|
    t.integer  "topic_id"
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "reply_to_id"
    t.string   "state",       default: "pending_review"
    t.boolean  "notified",    default: false
  end

  add_index "forem_posts", ["reply_to_id"], name: "index_forem_posts_on_reply_to_id"
  add_index "forem_posts", ["state"], name: "index_forem_posts_on_state"
  add_index "forem_posts", ["topic_id"], name: "index_forem_posts_on_topic_id"
  add_index "forem_posts", ["user_id"], name: "index_forem_posts_on_user_id"

  create_table "forem_subscriptions", force: true do |t|
    t.integer "subscriber_id"
    t.integer "topic_id"
  end

  create_table "forem_topics", force: true do |t|
    t.integer  "forum_id"
    t.integer  "user_id"
    t.string   "subject"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "locked",       default: false,            null: false
    t.boolean  "pinned",       default: false
    t.boolean  "hidden",       default: false
    t.datetime "last_post_at"
    t.string   "state",        default: "pending_review"
    t.integer  "views_count",  default: 0
    t.string   "slug"
  end

  add_index "forem_topics", ["forum_id"], name: "index_forem_topics_on_forum_id"
  add_index "forem_topics", ["slug"], name: "index_forem_topics_on_slug", unique: true
  add_index "forem_topics", ["state"], name: "index_forem_topics_on_state"
  add_index "forem_topics", ["user_id"], name: "index_forem_topics_on_user_id"

  create_table "forem_views", force: true do |t|
    t.integer  "user_id"
    t.integer  "viewable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "count",             default: 0
    t.string   "viewable_type"
    t.datetime "current_viewed_at"
    t.datetime "past_viewed_at"
  end

  add_index "forem_views", ["updated_at"], name: "index_forem_views_on_updated_at"
  add_index "forem_views", ["user_id"], name: "index_forem_views_on_user_id"
  add_index "forem_views", ["viewable_id"], name: "index_forem_views_on_viewable_id"

  create_table "friendships", force: true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ghost_logs", force: true do |t|
    t.integer  "battle_id"
    t.string   "description"
    t.string   "type"
    t.boolean  "bMessage"
    t.integer  "item_id"
    t.integer  "pet_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "utility_type"
    t.integer  "ghost_id"
    t.integer  "rand_amount"
  end

  create_table "ghosts", force: true do |t|
    t.integer  "pet_id"
    t.string   "name"
    t.float    "health"
    t.float    "magic"
    t.text     "description"
    t.integer  "user_id"
    t.string   "element"
    t.string   "imageurl"
    t.integer  "battle_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "item1_id"
    t.integer  "item2_id"
    t.integer  "item3_id"
    t.integer  "item4_id"
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
    t.string   "utility_type"
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

  create_table "monologue_posts", force: true do |t|
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "title"
    t.text     "content"
    t.string   "url"
    t.datetime "published_at"
  end

  add_index "monologue_posts", ["url"], name: "index_monologue_posts_on_url", unique: true

  create_table "monologue_taggings", force: true do |t|
    t.integer "post_id"
    t.integer "tag_id"
  end

  add_index "monologue_taggings", ["post_id"], name: "index_monologue_taggings_on_post_id"
  add_index "monologue_taggings", ["tag_id"], name: "index_monologue_taggings_on_tag_id"

  create_table "monologue_tags", force: true do |t|
    t.string "name"
  end

  add_index "monologue_tags", ["name"], name: "index_monologue_tags_on_name"

  create_table "monologue_users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
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
    t.integer  "battle_id"
    t.integer  "ghost_wins"
    t.integer  "ghost_losses"
    t.integer  "player_wins"
    t.integer  "player_losses"
    t.string   "favorite_activity"
    t.string   "disposition"
    t.integer  "against_ghost_wins"
    t.integer  "against_ghost_losses"
  end

  create_table "posts", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "transactions", force: true do |t|
    t.integer  "user_id"
    t.string   "address"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",               null: false
    t.string   "encrypted_password",     default: "",               null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                null: false
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
    t.float    "coin_made"
    t.integer  "block_io_wallet_id"
    t.string   "channel_key"
    t.boolean  "if_accepted_terms"
    t.boolean  "forem_admin",            default: false
    t.string   "forem_state",            default: "pending_review"
    t.boolean  "forem_auto_subscribe",   default: false
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

  create_table "wallpapers", force: true do |t|
    t.string   "imageurl"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "price"
  end

end
