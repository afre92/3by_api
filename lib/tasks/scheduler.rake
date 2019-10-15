namespace :scheduler do

	desc "Pull new videos from yt playlist"
	task get_videos: :environment do
		playlists = Playlist.all
			playlists.each do |playlist|
				yt_playlist = Yt::Playlist.new id: playlist.yt_id
					yt_playlist.playlist_items.each do |playlist_item|
						playlist_item = playlist_item.snippet.data
						video = Video.new

						yt_video = Yt::Video.new id:  playlist_item['resourceId']['videoId']
						video.playlist_id = playlist.id
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