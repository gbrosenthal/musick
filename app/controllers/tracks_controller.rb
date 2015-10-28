class TracksController < ApplicationController

  before_action :logged_in
  before_action :set_track, only: [:show]

  def show
    @comments = @track.track_comments
    @track_comment = @track.track_comments.build
  end

  def votes
    @track_like = TrackLike.where(track_id: params[:id], user_id: current_user.id).first

    if @track_like.blank?
      track = Track.find(params[:id])
      @track_like = TrackLike.new(
          :user_id => current_user.id,
          :track_id => track.id,
          :playlist_id => track.playlist.id,
          :liked => 1)
      @track_like.save

    elsif @track_like.liked > 0
      @track_like.update_attribute(:liked, 0)
    else
      @track_like.update_attribute(:liked, 1)
    end

    if request.xhr?
      count = TrackLike.where(track_id: @track_like.track_id, liked: 1).count
      render json: { count: count , id: params[:id] }
    else
      redirect_to @track_like
    end

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_track
    @track = Track.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def playlist_params
    params.require(:track).permit(:count)
  end

end
