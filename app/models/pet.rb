class Pet < ApplicationRecord
  belongs_to :user
  validates :name, :address, :age, :postcode, :description, :price, :start_date, :end_date, :photo, presence: true
  has_one_attached :photo
  has_many :requests
end
