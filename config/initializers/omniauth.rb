require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  client_id = '323d390ef6304f9a9556ec8cdd648883'
  client_secret = '8bab63f610b1407fbee6b641cc6137aa'
  provider :spotify, client_id, client_secret, scope: 'user-read-private playlist-modify-public user-library-read user-library-modify'
end