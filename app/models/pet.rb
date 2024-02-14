class Pet < ApplicationRecord
  belongs_to :user
  validates :name, :address, :age, :postcode, :description, :price, :start_date, :end_date, presence: true
end
