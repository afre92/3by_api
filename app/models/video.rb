class Video < ApplicationRecord
	has_many :liked_videos
  has_many :users, through: :liked_videos
  validates_uniqueness_of :yt_id
end
