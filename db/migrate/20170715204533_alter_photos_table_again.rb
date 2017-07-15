class AlterPhotosTableAgain < ActiveRecord::Migration[5.0]
  def change
    remove_column :photos, :photo
    add_column :photos, :photos, :json
  end
end
