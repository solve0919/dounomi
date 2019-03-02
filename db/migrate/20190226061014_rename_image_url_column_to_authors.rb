class RenameImageUrlColumnToAuthors < ActiveRecord::Migration[5.2]
  def change
    rename_column :authors, :image_url, :password
  end
end
