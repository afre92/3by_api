class ChangeDataTypeYoutubeId < ActiveRecord::Migration[5.2]
  def change
  	 change_column :videos, :yt_id, :string
  end
end
