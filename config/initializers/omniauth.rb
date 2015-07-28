require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify,
           Rails.application.secrets.spotify_id,
           Rails.application.secrets.spotify_client,
           scope: 'user-read-private playlist-modify-public user-library-read user-library-modify playlist-read-collaborative',
           authorize_params: {
               show_dialog: 'true'
           }
end