class PetsController < ApplicationController
  before_action :set_pet, only: %i[show]
  def index
    @pets = Pet.all
  end
  def show
  end

  def set_pet
    @pet = Pet.find(params[:id])
  end
end
