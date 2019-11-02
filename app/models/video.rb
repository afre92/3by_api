class Video < ApplicationRecord
	has_many :disliked_videos, dependent: :delete_all
	has_many :liked_videos, dependent: :delete_all
  has_many :users, through: :liked_videos
  has_many :users, through: :disliked_videos
  validates_uniqueness_of :yt_id

  def previous
    video = Video.where("playlist_id = ? AND id < ?", self.playlist_id, self.id).last
    video.present? ? video.id : Video.where("playlist_id = ? AND id > ?", self.playlist_id, self.id).last.id
  end

  def next
    video = Video.where("playlist_id = ? AND id > ?", self.playlist_id, self.id).first
    video.present? ? video.id : Video.where("playlist_id = ? AND id < ?", self.playlist_id, self.id).first.id
  end

end
