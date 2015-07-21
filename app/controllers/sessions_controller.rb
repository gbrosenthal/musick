class SessionsController < ApplicationController


  def create
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])

    user = User.where(spotify_id: spotify_user.id).first
    hash = spotify_user.to_hash

    if user.blank?
      user = User.new(:spotify_id => spotify_user.id.to_s,
                      :display_name => spotify_user.display_name,
                      :birthday => spotify_user.birthdate,
                      :spotify_hash => hash,
                      :login_expires_at => Time.now + 1.day,
                      :image => spotify_user.images.first["url"])
      if user.save!
        puts "user saved"
        session[:user_id] = user.id
        redirect_to root_path and return
      else
        redirect_to 'error' and return
      end
    else

      user.update_attribute(:login_expires_at, Time.now + 1.day)
      session[:user_id] = user.id
      redirect_to root_path
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def error
  end

end
