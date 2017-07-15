class AddColumnToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :images, :string, array: true, default: []
    remove_column :photos, :photo
  end
end
