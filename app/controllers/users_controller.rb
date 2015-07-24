require 'json'
require 'will_paginate/array'

class UsersController < ApplicationController

  before_action :logged_in
  before_action :set_user, only: [:import, :show, :edit, :update, :destroy]

  # POST /
  def import
    spotify_user = RSpotify::User.new(current_user.spotify_hash)
    playlists = spotify_user.playlists

    playlists.each do |playlist|

      if playlist.public && playlist.owner.id == current_user.spotify_id
        image = ""
        unless playlist.images.blank?
          image = playlist.images.first["url"]
        end

        collab = playlist.collaborative ? 1 : 0

        playlistHash = {:display_name => playlist.name,
                        :score => 1,
                        :user_id => current_user.id,
                        :image => image,
                        :collaborative => collab,
                        :followers => playlist.followers['total']}

        bot_playlist = Playlist.where(spotify_id: playlist.id).first

        if bot_playlist
          bot_playlist.update_attributes(playlistHash)
        else
          playlistHash["spotify_id"] = playlist.id
          bot_playlist = Playlist.new(playlistHash)
        end

        if bot_playlist.save
          tracks = playlist.tracks

          tracks.each do |track|

            bot_track = Track.where(spotify_id: track.id, playlist_id: bot_playlist.id).first

            unless bot_track
              artist = track.artists.first
              bot_track = Track.new(:display_name => track.name,
                                    :artist_name => artist.name,
                                    :spotify_id => track.id,
                                    :score => 1,
                                    :playlist_id => bot_playlist.id)

              if bot_track.save
                puts "Track Saved"
              end
            end
          end
        end

      end

    end

    current_user.update_attribute(:imported, true)
    flash[:success] = "Updated User's Library"
    redirect_to :back
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all.paginate(page: params[:page])
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @playlists = Playlist.where(user_id: @user.id).order("display_name ASC")
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:display_name, :spotify_id, :birthday, :spotify_hash)
  end
end
