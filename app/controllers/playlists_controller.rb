class PlaylistsController < ApplicationController
	before_action :authorize_request
	before_action :find_playlist, except: %i[index]

	def index
    @playlists = Playlist.all
    render json: @playlists, status: :ok
  end

  # GET /playlist/{playlist_name}
  def show
  	playlist = {}
  	playlist['name'] = @playlist.name
  	playlist['yt_id'] = @playlist.yt_id
  	playlist['videos'] = playlist_videos
    render json: playlist, status: :ok
  end

  def playlist_videos
    if @playlist.name != "recommended"
      return [@playlist.videos.order('id DESC')]
    else
      return [@current_user.recommend_videos]
    end
  end

  private

  def find_playlist
    @playlist = Playlist.find_by_name!(params[:name])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'Playlist not found' }, status: :not_found
  end

end
