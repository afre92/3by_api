class AddPlaylistIdToVideos < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :playlist_id, :int
  end
end
