class CreateDislikedVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :disliked_videos do |t|
      t.integer :video_id
      t.integer :user_id

      t.timestamps
    end
  end
end
