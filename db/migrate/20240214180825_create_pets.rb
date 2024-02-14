class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :age
      t.text :address
      t.string :postcode
      t.text :description
      t.float :price
      t.references :user, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
