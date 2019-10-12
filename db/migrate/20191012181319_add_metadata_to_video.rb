class AddMetadataToVideo < ActiveRecord::Migration[5.2]
  def change
  	add_column :videos, :view_count, :int
  	add_column :videos, :like_count, :int
  	add_column :videos, :dislike_count, :int
  	add_column :videos, :lenght, :string
  	add_column :videos, :embed_html, :string

  end
end
