class PlaylistsController < ApplicationController
	before_action :authorize_request
	before_action :find_user, except: %i[index]

	def index
    @playlists = Playlist.all
    render json: @playlists, status: :ok
  end

  # GET /playlist/{playlist_name}
  def show
    render json: @playlist, status: :ok
  end

  private

  def find_playlist
    @playlist = Playlist.find_by_name!(params[:name])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'Playlist not found' }, status: :not_found
  end

end
