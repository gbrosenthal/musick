class ChangeTrackAddedByUri < ActiveRecord::Migration
  def change
    rename_column :tracks, :added_by_uri, :added_by_uid
  end
end
