class AddJsonPhotoFieldToPhotoTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :photos, :photo
    add_column :photos, :photo, :json
  end
end
