class FixCommentName < ActiveRecord::Migration
  def change
    rename_column :track_comments, :comment, :text
  end
end
