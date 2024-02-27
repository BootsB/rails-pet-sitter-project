class AddCityAndCountryColumnsToPets < ActiveRecord::Migration[7.0]
  def change
    add_column :pets, :city, :string
    add_column :pets, :country, :string
  end
end
