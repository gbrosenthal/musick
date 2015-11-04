class PlaylistsController < ApplicationController

  before_action :logged_in
  before_action :set_playlist, only: [:show]

  def show
    # sql = "SELECT * FROM tracks WHERE playlist_id=" +@playlist.id.to_s+" ORDER BY (SELECT COUNT(*) FROM track_likes WHERE liked='t' AND track_id=tracks.id) DESC"
    # @tracks =  Track.paginate_by_sql(sql, :page => params[:page], :per_page => 15)
    @tracks = Track.find_by_sql("SELECT * FROM tracks WHERE playlist_id=" +@playlist.id.to_s+" ORDER BY (SELECT COUNT(*) FROM track_likes WHERE liked=1 AND track_id=tracks.id) DESC;")
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_playlist
    @playlist = Playlist.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def playlist_params
    params.require(:playlist).permit(:count)
  end

end
