	desc "Pull new videos from yt playlist"
	task import_videos: :environment do
		playlists = Playlist.all
			playlists.each do |playlist|
				next if playlist.name == "recommended"
				yt_playlist = Yt::Playlist.new id: playlist.yt_id
				last_video_added = playlist.videos.last ? playlist.videos.last.published_at : 10.years.ago.rfc3339+"0000"
					yt_playlist.playlist_items.each do |playlist_item|
						begin
							playlist_item = playlist_item.snippet.data
							next if playlist_item['publishedAt'][0..-9] <= last_video_added[0..-9]
							video = Video.new
							yt_video = Yt::Video.new id:  playlist_item['resourceId']['videoId']
							video.playlist_id = playlist.id
							video.published_at = playlist_item['publishedAt']
							video.channel_title = yt_video.channel_title
							video.view_count = yt_video.view_count
							video.like_count = yt_video.like_count
							video.dislike_count = yt_video.dislike_count
							video.length = yt_video.length
							video.embed_html = yt_video.embed_html
							video.title = yt_video.title
							video.description = yt_video.description
							video.yt_id = yt_video.id
							video.thumbnails = playlist_item['thumbnails']
							if video.save!
								puts "Video with title #{video.title} WAS be saved"
							else
								puts "Video with title #{video.title} could NOT be saved"
							end
						rescue StandardError => e
							  puts "Rescued: #{e.inspect}"
						end
					end
			end
	end


	# desc "like_with_test_data"
	# task simulate_likes: :environment do 
	# 	100.times do
	#   user = User.all[rand(0...30)]
	#   video = Video.all[rand(0...15)]
	#   byebug
	#   if user.videos.include?(video)
	#     next
	#   else
	#     user.videos << video
	#   end
	# end
	# end