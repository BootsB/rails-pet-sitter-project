class AddPhoneNumberToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :phone_number, :string
  end
end
