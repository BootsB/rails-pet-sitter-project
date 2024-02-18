class Profile < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  has_one_attached :photo

  enum role: { pet_owner: "pet_owner", pet_sitter: "pet_sitter" }
end
