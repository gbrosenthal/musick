class CreateTrackComments < ActiveRecord::Migration
  def change
    create_table :track_comments do |t|
      t.integer :track_id
      t.integer :playlist_id
      t.integer :user_id
      t.integer :recipient_id
      t.text :comment
    end
  end
end
