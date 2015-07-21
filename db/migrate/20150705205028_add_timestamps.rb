class AddTimestamps < ActiveRecord::Migration
  def change
    add_column(:users, :created_at, :datetime)
    add_column(:users, :updated_at, :datetime)

    add_column(:playlists, :created_at, :datetime)
    add_column(:playlists, :updated_at, :datetime)

    add_column(:tracks, :created_at, :datetime)
    add_column(:tracks, :updated_at, :datetime)
  end
end
