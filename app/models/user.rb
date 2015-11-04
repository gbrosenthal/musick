class User < ActiveRecord::Base
  serialize :spotify_hash, JSON
  serialize :stored_playlists

  has_many :track_comments, dependent: :destroy
  has_many :playlists, dependent: :destroy

  def remember
    # self.remember_token = User.new_token
    # update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    # update_attribute(:remember_digest, nil)
  end

end
