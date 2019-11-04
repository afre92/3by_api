class VideosController < ApplicationController
	before_action :authorize_request
	before_action :find_video

	def reaction
		if params['reaction'] == 'liked'
			like_video
		elsif params['reaction'] == 'disliked'
			dislike_video
		end

		render json: {liked: video_liked?, disliked: video_disliked? }, status: :ok
	end

	def show
		data = {}
		data['video'] = @video
		data['next'] = @video.next 
		data['previous'] = @video.previous
		data['liked'] = video_liked?
		data['disliked'] = video_disliked?
		render json: data, status: :ok
	end

	private

		def video_liked?
			LikedVideo.find_by(user_id: @current_user.id, video_id: @video.id).present?
		end

		def video_disliked?
			DislikedVideo.find_by(user_id: @current_user.id, video_id: @video.id).present?
		end

		def find_video
			@video = Video.find(params[:id])
		end

		def like_video
			return unless !video_liked?
			LikedVideo.create({user_id: @current_user.id, video_id: @video.id})
			DislikedVideo.find_by(user_id: @current_user.id, video_id: @video.id).try(:destroy)
		end 

		def dislike_video
			return unless !video_disliked?
			DislikedVideo.create({user_id: @current_user.id, video_id: @video.id})
			LikedVideo.find_by(user_id: @current_user.id, video_id: @video.id).try(:destroy)
		end
end
