class VideosController < ApplicationController
	before_action :authorize_request
	before_action :find_video

	def reaction
		byebug
		if params['reaction'] == 'like'
			# find or create
			if !LikedVideo.where(user_id: @current_user.id, video_id: @video.id).first.present?
				LikedVideo.create({user_id: @current_user.id, video_id: @video.id})
			end
				render json: {liked: true, disliked: false }, status: :ok
		else
				# dislike
		end

	end

	def show
		video = {}
		video['video'] = @video
		video['next'] = @video.next 
		video['previous'] = @video.previous
		video['liked'] = liked_video?
		render json: video, status: :ok
	end


	def liked_video?
		LikedVideo.where(user_id: @current_user.id, video_id: @video.id).first.present?
	end

	private

		def find_video
			@video = Video.find(params[:id])
		end
end
