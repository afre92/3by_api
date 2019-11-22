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
      (user.videos + common_videos).each do |video|
        # put the video along with the cumulative weight into hash
        recommended[video.id] += weight
      end
    end
    # sort by weight in descending order
    sorted_recommended = recommended.sort_by { |key, value| value }.reverse
    videos = []
    if sorted_recommended.present?
      sorted_recommended.each do |id, rating|
        videos << Video.find(id)
      end
    else
      # sends last three videos to avoid site crash
      videos = Video.last(3)
    end
    videos
  end
end