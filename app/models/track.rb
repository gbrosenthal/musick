class Track < ActiveRecord::Base

  belongs_to :playlist
  has_many :track_likes, dependent: :destroy
  has_many :track_comments, dependent: :destroy

  validates :display_name, presence: true
  validates :spotify_id, presence: true
  validates :playlist_id, presence: true
  validates :score, presence: true
  validates :artist_name, presence: true


  def get_likes
    TrackLike.where(track_id: self.id, liked: 1).count
  end

  def liked_by_user(user)
    result = TrackLike.where(track_id: self.id, liked: 1, user_id: user.id).first
    result.blank? ? 0 : 1
  end

end
