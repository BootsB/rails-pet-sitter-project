class ChangeRoleInPorfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :role, :string
  end
end
