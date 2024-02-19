class RenameTypeColumnInPets < ActiveRecord::Migration[7.0]
  def change
    rename_column :pets, :type, :category
  end
end
