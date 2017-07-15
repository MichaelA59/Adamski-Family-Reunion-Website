class AlterPhotosTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :photos, :images
    add_column :photos, :photo, :string
  end
end
