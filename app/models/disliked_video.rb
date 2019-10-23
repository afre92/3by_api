class DislikedVideo < ApplicationRecord
	validates_uniqueness_of :user_id, scope: %i[video_id]
	belongs_to :user
  belongs_to :video
end
