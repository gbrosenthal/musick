class Playlist < ActiveRecord::Base

  has_many :tracks, dependent: :destroy

  belongs_to :user
  validates :display_name, presence: true
  validates :spotify_id, presence: true
  validates :user_id, presence: true
  validates :score, presence: true
  validates :collaborative, presence: true
  validates :followers, presence: true

  def get_track_likes
    TrackLike.where(playlist_id: id).count
  end

  def get_likes
    PlaylistLike.where(playlist_id: id).count
  end

end
