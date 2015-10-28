class AddAddedByToTrack < ActiveRecord::Migration
  def change
    add_column :tracks, :added_by_uri, :string
  end
end
