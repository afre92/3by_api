namespace :scheduler do

	desc "Pull new videos from youtube playlist"
	task get_videos: :environment do
		playlists = Playlist.all
			playlists.each do |playlist|
				yt_playlist = Yt::Playlist.new id: playlist.yt_id
					yt_playlist.playlist_items.each do |playlist_item|
						playlist_item = playlist_item.snippet.data
						video = Video.new
						video.playlist_id = playlist.id
						youtube_video = Yt::Video.new id:  playlist_item['resourceId']['videoId']
						
						#should take most of the data from youtube_video instead off playlist?

						video.title = playlist_item['title']
						video.description = playlist_item['description']
						video.thumbnails = playlist_item['thumbnails']
						video.yt_id = playlist_item['resourceId']['videoId']
						if video.save!
							puts "Video with title #{video.title} WAS be saved"
						else
							puts "Video with title #{video.title} could NOT be saved"
						end
					end
			end
		end
end