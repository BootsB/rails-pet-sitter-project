class AddTypeColumnToPets < ActiveRecord::Migration[7.0]
  def change
    add_column :pets, :type, :integer
  end
end
