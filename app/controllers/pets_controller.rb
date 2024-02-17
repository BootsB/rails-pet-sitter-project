class PetsController < ApplicationController
  before_action :set_pet, only: %i[show edit update]
  def index
    @pets = Pet.all
  end

  def show
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    if @pet.save
      redirect_to pets_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @pet.update(pet_params)
      redirect_to @pet, notice: "Pet was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :age, :address, :postcode, :description, :price, :start_date, :end_date)
  end

  def set_pet
    @pet = Pet.find(params[:id])
  end
end
