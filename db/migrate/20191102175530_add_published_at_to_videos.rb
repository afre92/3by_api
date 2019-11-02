class AddPublishedAtToVideos < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :published_at, :string
  end
end
