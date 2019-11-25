
require "faker"

User.destroy_all
Video.destroy_all
# using faker gem to create unique names to create users
30.times { User.create(title: Faker::Name.unique.name, username: Faker::Name.unique.name, email: Faker::Internet.unique.email, password: 'asdfasdf', password_confirmation: 'asdfasdf') }

Playlist.create(name: 'chilling', yt_id: 'PLzWX0IlMcM22RwY8hnL-FSqplemD6cBjB')
Playlist.create(name: 'random', yt_id: 'PLzWX0IlMcM23T23g894hJwcYCx6zPWG3c')
Playlist.create(name: 'funny', yt_id: 'PLzWX0IlMcM20P9t3BADblAOvmJvXQ1wZM')
Playlist.create(name: 'trending', yt_id: 'PLzWX0IlMcM23KDgEDRZbiGw2BhnoIjtmW')
Playlist.create(name: 'geeky', yt_id: 'PLzWX0IlMcM20Ii_3QjCme97JLZKgxnGkI')
Playlist.create(name: 'recommended', yt_id: 'asdfasdf')

