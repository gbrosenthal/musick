class AddStoredPlaylistIdsToUser < ActiveRecord::Migration
  def change
    add_column :users, :stored_playlists, :string
  end
end
