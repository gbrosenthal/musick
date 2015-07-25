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

ActiveRecord::Schema.define(version: 20150725204138) do

  create_table "playlist_likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "playlist_id"
    t.integer "liked"
  end

  create_table "playlists", force: :cascade do |t|
    t.string   "display_name"
    t.string   "spotify_id"
    t.integer  "user_id"
    t.integer  "score"
    t.text     "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "collaborative"
    t.integer  "followers"
  end

  create_table "track_likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "track_id"
    t.integer "liked"
    t.integer "playlist_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.string   "display_name"
    t.string   "spotify_id"
    t.integer  "playlist_id"
    t.integer  "score"
    t.string   "artist_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "display_name"
    t.string   "spotify_id"
    t.string   "birthday"
    t.text     "spotify_hash"
    t.datetime "login_expires_at"
    t.integer  "imported"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "image"
  end

end
