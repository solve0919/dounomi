class RenameDescriptionColumnToAuthors < ActiveRecord::Migration[5.2]
  def change
    rename_column :authors, :description, :email
  end
end
