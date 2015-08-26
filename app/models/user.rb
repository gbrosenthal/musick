class User < ActiveRecord::Base
  serialize :spotify_hash, JSON


  def remember
    # self.remember_token = User.new_token
    # update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    # update_attribute(:remember_digest, nil)
  end

end
