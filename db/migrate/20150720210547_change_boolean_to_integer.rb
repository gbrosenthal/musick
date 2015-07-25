class ChangeBooleanToInteger < ActiveRecord::Migration
  def change
    change_column(:track_likes, :liked, 'integer USING CAST(liked AS integer)')
    change_column(:users, :imported, 'integer USING CAST(liked AS integer)')
  end
end
