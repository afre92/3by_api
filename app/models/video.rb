class Video < ApplicationRecord
	has_many :liked_videos
  has_many :users, through: :liked_videos
  validates_uniqueness_of :yt_id

  def previous
    video = Video.where("playlist_id = ? AND id < ?", self.playlist_id, self.id).first
    video.present? ? video.id : ''
  end

  def next
    video = Video.where("playlist_id = ? AND id > ?", self.playlist_id, self.id).first
    video.present? ? video.id : ''
  end

end
