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

ActiveRecord::Schema.define(version: 20151108004209) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.text     "body"
    t.integer  "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["item_id"], name: "index_comments_on_item_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.integer  "item_id"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "images", ["item_id"], name: "index_images_on_item_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "voting_id"
    t.string   "title"
    t.boolean  "special"
    t.boolean  "fixed"
    t.string   "birthday_name"
    t.integer  "image_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "cached_votes_total",      default: 0
    t.integer  "cached_votes_score",      default: 0
    t.integer  "cached_votes_up",         default: 0
    t.integer  "cached_votes_down",       default: 0
    t.integer  "cached_weighted_score",   default: 0
    t.integer  "cached_weighted_total",   default: 0
    t.float    "cached_weighted_average", default: 0.0
  end

  add_index "items", ["cached_votes_down"], name: "index_items_on_cached_votes_down", using: :btree
  add_index "items", ["cached_votes_score"], name: "index_items_on_cached_votes_score", using: :btree
  add_index "items", ["cached_votes_total"], name: "index_items_on_cached_votes_total", using: :btree
  add_index "items", ["cached_votes_up"], name: "index_items_on_cached_votes_up", using: :btree
  add_index "items", ["cached_weighted_average"], name: "index_items_on_cached_weighted_average", using: :btree
  add_index "items", ["cached_weighted_score"], name: "index_items_on_cached_weighted_score", using: :btree
  add_index "items", ["cached_weighted_total"], name: "index_items_on_cached_weighted_total", using: :btree
  add_index "items", ["image_id"], name: "index_items_on_image_id", using: :btree
  add_index "items", ["user_id"], name: "index_items_on_user_id", using: :btree
  add_index "items", ["voting_id"], name: "index_items_on_voting_id", using: :btree

  create_table "results", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "voting_id"
    t.date     "scheduled_on"
    t.integer  "total_votes"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "results", ["item_id"], name: "index_results_on_item_id", using: :btree
  add_index "results", ["voting_id"], name: "index_results_on_voting_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["provider"], name: "index_users_on_provider", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

  create_table "votings", force: :cascade do |t|
    t.string   "title"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
