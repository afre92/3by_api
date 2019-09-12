require './lib/recommendation.rb'

class User < ApplicationRecord

	include Recommendation

	has_many :liked_videos
  has_many :videos, through: :liked_videos

  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }
end