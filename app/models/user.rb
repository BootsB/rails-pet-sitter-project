class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :pets
  has_many :requests
  has_one  :profile

  def pet_owner?
    profile.present? && profile.role == 'pet_owner'
  end

  def pet_sitter?
    profile.present? && profile.role == 'pet_sitter'
  end

  def both?
    profile.present? && profile.role == 'both'
  end
end
