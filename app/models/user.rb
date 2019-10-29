require './lib/recommendation.rb'

class User < ApplicationRecord

	include Recommendation

	has_many :liked_videos
  has_many :videos, through: :liked_videos

  has_many :disliked_videos
  has_many :videos, through: :disliked_videos

  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }



  # assocaite random videos to user passed
  def associate_random_videos(user_id)
    100.times do
      user = User.find(user_id)
      video = Video.all[rand(0...15)]
      if user.videos.include?(video)
        next
      else
        user.videos << video
      end
    end
  end

end