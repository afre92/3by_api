class RemoveFieldVideosAndAddColumnToPlaylist < ActiveRecord::Migration[5.2]
  def change
  	remove_column :videos, :name
  	remove_column :videos, :url
  	add_column :videos, :views, :int
  end
end
