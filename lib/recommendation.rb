module Recommendation
  # recommend videos to a user
  def recommend_videos 
    other_users = self.class.all.where.not(id: self.id)
    recommended = Hash.new(0)
    other_users.each do |user|
      # find the videos this user and another user both liked
      common_videos = user.videos & self.videos
      # calculate the weight (recommendation rating)
      weight = common_videos.size.to_f / user.videos.size
      # add the extra videos the other user liked
      (user.videos — common_videos).each do |video|
        # put the video along with the cumulative weight into hash
        recommended[video] += weight
      end
    end
    # sort by weight in descending order
    sorted_recommended = recommended.sort_by { |key, value| value }.reverse
  end
end