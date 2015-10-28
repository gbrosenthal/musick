class TrackComment < ActiveRecord::Base

  belongs_to :track
  belongs_to :user

  validates :track_id, presence: true
  validates :playlist_id, presence: true
  validates :user_id, presence: true
  validates :recipient_id, presence: true
  validates :text, presence: true


end