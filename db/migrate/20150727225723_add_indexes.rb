class AddIndexes < ActiveRecord::Migration
  def change

    add_index :tracks, :spotify_id
    add_index :tracks, [:spotify_id, :playlist_id]

    add_index :playlists, :spotify_id

    add_index :track_likes, [:user_id, :track_id]
    add_index :playlist_likes, [:user_id, :playlist_id]


  end
end
