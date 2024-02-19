class AddAgeToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :age, :integer
  end
end
