class CreateTrackLikes < ActiveRecord::Migration
  def change
    create_table :track_likes do |t|
      t.integer :user_id
      t.integer :track_id
      t.boolean :liked
    end
  end
end
