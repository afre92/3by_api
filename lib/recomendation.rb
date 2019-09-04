module Recommendation
  # recommend movies to a user
  def recommend_movies 
    other_users = self.class.all.where.not(id: self.id)
    recommended = Hash.new(0)
    other_users.each do |user|
      # find the movies this user and another user both liked
      common_movies = user.movies & self.movies
      # calculate the weight (recommendation rating)
      weight = common_movies.size.to_f / user.movies.size
      # add the extra movies the other user liked
      (user.movies — common_movies).each do |movie|
        # put the movie along with the cumulative weight into hash
        recommended[movie] += weight
      end
    end
    # sort by weight in descending order
    sorted_recommended = recommended.sort_by { |key, value| value }.reverse
  end
end