class Pet < ApplicationRecord
  has_many :requests
  belongs_to :user
  validates :name, :address, :age, :postcode, :description, :price, :start_date, :end_date, :photo, :category, :country, :city, presence: true
  has_one_attached :photo
  enum category: {
    "Dog" => 0,
    "Cat" => 1,
    "Rabbit" => 2,
    "Ferret" => 3,
    "Fish" => 4,
    "Bird" => 5,
    "Other" => 6
  }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
