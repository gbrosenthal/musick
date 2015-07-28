class AddSpotifyUri < ActiveRecord::Migration
  def change

    add_column :playlists, :spotify_uri, :string
    add_column :tracks, :spotify_uri, :string
    add_column :users, :spotify_uri, :string

  end
end
