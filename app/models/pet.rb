class Pet < ApplicationRecord
  belongs_to :user
  has_many :requests
  validates :name, :address, :age, :postcode, :description, :price, :start_date, :end_date, :category, presence: true
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
