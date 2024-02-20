class Pet < ApplicationRecord
  has_many :requests
  belongs_to :user
  validates :name, :address, :age, :postcode, :description, :price, :start_date, :end_date, :photo, :category, presence: true
  has_one_attached :photo
  enum category: {
    "dog" => 0,
    "cat" => 1,
    "rabbit" => 2,
    "ferret" => 3,
    "fish" => 4,
    "bird" => 5,
    "other" => 6
  }
end
