class AddDisplayNameToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :added_by_display_name, :string
  end
end
