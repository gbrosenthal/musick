class User < ActiveRecord::Base
  serialize :spotify_hash, JSON
end
