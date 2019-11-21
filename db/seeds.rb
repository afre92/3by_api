
require "faker"

User.destroy_all
Video.destroy_all
# using faker gem to create unique names to create users
30.times { User.create(title: Faker::Name.unique.name, username: Faker::Name.unique.name, email: Faker::Internet.unique.email, password: 'asdfasdf', password_confirmation: 'asdfasdf') }


#chilling playlist
Playlist.create(name: 'chilling', yt_id: 'PLzWX0IlMcM22RwY8hnL-FSqplemD6cBjB')

#chilling playlist
Playlist.create(name: 'random', yt_id: 'PLzWX0IlMcM23T23g894hJwcYCx6zPWG3c')

#chilling playlist
Playlist.create(name: 'funny', yt_id: 'PLzWX0IlMcM20P9t3BADblAOvmJvXQ1wZM')

#chilling playlist
Playlist.create(name: 'trending', yt_id: 'PLzWX0IlMcM23KDgEDRZbiGw2BhnoIjtmW')

#chilling playlist
Playlist.create(name: 'geeky', yt_id: 'PLzWX0IlMcM20Ii_3QjCme97JLZKgxnGkI')

# create videos
# i = 0
# 15.times do
#   Video.create(name: videos[i])
#   i += 1
# end
# # randomly associate videos with users, where no user has the same videos more than once
# 100.times do
#   user = User.all[rand(0...30)]
#   video = Video.all[rand(0...15)]
#   if user.videos.include?(video)
#     next
#   else
#     user.videos << video
#   end
# end