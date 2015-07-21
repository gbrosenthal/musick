class CreateDatabase < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   "display_name"
      t.string   "spotify_id"
      t.string   "birthday"
      t.text     "spotify_hash"
      t.datetime "login_expires_at"
      t.boolean  "imported"
    end

    create_table :playlists do |t|
      t.string   "display_name"
      t.string   "spotify_id"
      t.integer  "user_id"
      t.integer  "score"
      t.text     "image"
    end

    create_table :tracks do |t|
      t.string   "display_name"
      t.string   "spotify_id"
      t.integer  "playlist_id"
      t.integer  "score"
      t.string   "artist_name"
    end

  end
end
