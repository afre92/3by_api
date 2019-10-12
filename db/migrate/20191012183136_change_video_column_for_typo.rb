class ChangeVideoColumnForTypo < ActiveRecord::Migration[5.2]
  def change
  	rename_column :videos, :lenght , :length
  end
end
