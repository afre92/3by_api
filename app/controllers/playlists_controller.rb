class PlaylistsController < ApplicationController
	before_action :authorize_request
	before_action :find_playlist, except: %i[index]

	def index
    @playlists = Playlist.all
    render json: @playlists, status: :ok
  end

  # GET /playlist/{playlist_name}
  def show
  	playlist_and_videos = {}
  	playlist_and_videos['name'] = @playlist.name
  	playlist_and_videos['yt_id'] = @playlist.yt_id
  	playlist_and_videos['videos'] = [@playlist.videos]
  	byebug
    render json: playlist_and_videos, status: :ok
  end

  private

  def find_playlist
    @playlist = Playlist.find_by_name!(params[:name])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'Playlist not found' }, status: :not_found
  end

end
