class CreatePlaylistLikes < ActiveRecord::Migration
  def change
    create_table :playlist_likes do |t|
      t.integer :user_id
      t.integer :playlist_id
      t.integer :liked
    end

    add_column :track_likes, :playlist_id, :integer

  end
end
