class AddChannelTitleToVideos < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :channel_title, :string
  end
end
