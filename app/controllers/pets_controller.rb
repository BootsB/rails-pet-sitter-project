class PetsController < ApplicationController
  before_action :set_pet, only: %i[show edit update destroy]

  def index
    puts "Received params: #{params.inspect}"
    @pet = Pet.new
    @pets = Pet.all
    @pets = Pet.where(category: params[:category]) if params[:category].present?
    @pets = @pets.where("START_DATE >= ?", params[:start_date]) if params[:start_date].present?
    @pets = @pets.where("END_DATE <= ?", params[:end_date]) if params[:end_date].present?
    respond_to do |format|
      format.html
      format.text { render partial: "pets/pet_info", locals: {pets: @pets}, formats: [:html] }
    end
  end

  def show
    @coords = {
      lat: @pet.latitude,
      lng: @pet.longitude
    }
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @pet.update(pet_params)
      redirect_to @pet, notice: "Successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @pet.destroy
    redirect_to pets_url, notice: "Successfully destroyed."
  end


  private

  def pet_params
    params.require(:pet).permit(:name, :age, :address, :postcode, :description, :price, :start_date, :end_date, :category, :photo)
  end

  def set_pet
    @pet = Pet.find(params[:id])
  end
end
