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

ActiveRecord::Schema.define(version: 20150604130159) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "group_watchlists", force: :cascade do |t|
    t.integer "group_id"
    t.integer "movie_id"
  end

  add_index "group_watchlists", ["group_id"], name: "index_group_watchlists_on_group_id", using: :btree
  add_index "group_watchlists", ["movie_id"], name: "index_group_watchlists_on_movie_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "description"
  end

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.string   "imdb_id"
    t.string   "poster_path"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "user_watchlists", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "watched",    default: false
  end

  add_index "user_watchlists", ["movie_id"], name: "index_user_watchlists_on_movie_id", using: :btree
  add_index "user_watchlists", ["user_id"], name: "index_user_watchlists_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "uid"
    t.string   "provider"
    t.string   "username"
    t.string   "email"
    t.string   "image_url"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "token"
  end

  add_foreign_key "group_watchlists", "groups"
  add_foreign_key "group_watchlists", "movies"
  add_foreign_key "user_watchlists", "movies"
  add_foreign_key "user_watchlists", "users"
end
