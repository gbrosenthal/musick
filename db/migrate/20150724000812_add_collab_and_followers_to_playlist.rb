class AddCollabAndFollowersToPlaylist < ActiveRecord::Migration
  def change
    add_column :playlists, :collaborative, :integer
    add_column :playlists, :followers, :integer
  end
end
