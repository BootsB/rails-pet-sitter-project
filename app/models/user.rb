class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :pets
  has_many :requests
  has_many :pet_requests, through: :pets, source: :requests
  has_one  :profile

  # PET OWNER START
  def pet_owner?
    profile.present? && profile.role == 'pet_owner'
  end

  def owner_pets
    pets if pet_owner?
  end
  # PET OWNER END

  # PET SITTER START
  def pet_sitter?
    profile.present? && profile.role == 'pet_sitter'
  end

  def sitter_pets
    pets if pet_sitter?
  end
  # PET SITTER END

  # PET BOTH START
  def both?
    profile.present? && profile.role == 'both'
  end

  def both_pets
    pets if both?
  end
  # PET BOTH END
end
