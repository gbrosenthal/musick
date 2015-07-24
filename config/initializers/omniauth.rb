require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  client_id = Rails.application.secrets.spotify_id
  client_secret = Rails.application.secrets.spotify_client
  provider :spotify, client_id, client_secret, scope: 'user-read-private playlist-modify-public user-library-read user-library-modify playlist-read-collaborative'
end