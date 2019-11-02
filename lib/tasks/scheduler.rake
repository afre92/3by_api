namespace :scheduler do

	desc "Pull new videos from yt playlist"
	task import_videos: :environment do
		playlists = Playlist.all
			playlists.each do |playlist|
				yt_playlist = Yt::Playlist.new id: playlist.yt_id
				# here add query to get
				#get videos which published at is in between the lastest video added from this playlist and todays date
				last_video_added = playlist.videos.last ? playlist.videos.last.published_at : 10.years.ago
				# get last video added from this list
					yt_playlist.playlist_items.each do |playlist_item|
						# since quering cant be done just to next
						byebug
						next if playlist_item.published_at.to_datetime < last_video_added
						byebug
						playlist_item = playlist_item.snippet.data
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
					end
			end
		end
end