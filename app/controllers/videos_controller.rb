class VideosController < ApplicationController
	before_action :authorize_request
	before_action :find_video

	def show
		video = {}
		video['video'] = @video
		video['next'] = @video.next 
		video['previous'] = @video.previous
		render json: video, status: :ok
	end

	private

		def find_video
			@video = Video.find(params[:id])
		end
end
