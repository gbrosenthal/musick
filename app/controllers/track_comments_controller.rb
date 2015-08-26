class TrackCommentsController < ApplicationController
  before_action :logged_in

  def create
    track = Track.find(track_comment_params[:track_id])
    playlist = Playlist.find(track.playlist_id)

    @track_comment = TrackComment.new(track_id: track.id,
                                      playlist_id: playlist.id,
                                      user_id: current_user.id,
                                      recipient_id: playlist.user_id,
                                      comment: track_comment_params[:comment])


    if @track_comment.save
      flash[:success] = "Comment Posted"
      redirect_to track
    end
  end

  private

  def track_comment_params
    params.require(:track_comment).permit(:track_id, :comment)
  end


end
