
require "faker"

User.destroy_all
Video.destroy_all
# using faker gem to create unique names to create users
30.times { User.create(title: Faker::Name.unique.name, username: Faker::Name.unique.name, email: Faker::Internet.unique.email, password: 'asdfasdf', password_confirmation: 'asdfasdf') }

videos = ["Avengers: Infinity War", "Star Wars: The Force Awakens", "Avatar", "Titanic", "Jurassic World", "Black Panther", "Marvel’s The Avengers", "Star Wars: The Last Jedi", "The Dark Knight", "Beauty and the Beast", "Finding Dory", "Pirates of the Caribbean: Dead Man’s Chest", "Toy Story 3", "Wonder Woman", "Iron Man 3"]
# create videos
i = 0
15.times do
  Video.create(name: videos[i])
  i += 1
end
# randomly associate videos with users, where no user has the same videos more than once
100.times do
  user = User.all[rand(0...30)]
  video = Video.all[rand(0...15)]
  if user.videos.include?(video)
    next
  else
    user.videos << video
  end
end