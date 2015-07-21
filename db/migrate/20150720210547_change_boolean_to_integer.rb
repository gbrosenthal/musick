class ChangeBooleanToInteger < ActiveRecord::Migration
  def change
    change_column(:track_likes, :liked, :integer)
    change_column(:users, :imported, :integer)
  end
end
