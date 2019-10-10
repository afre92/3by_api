class AddYoutubeFieldsToVideo < ActiveRecord::Migration[5.2]
  def change
  	add_column :videos, :title, :string
  	add_column :videos, :description, :text
  	add_column :videos, :thumbnails, :json
  	add_column :videos, :yt_id, :int
  end
end
