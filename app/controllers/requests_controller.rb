class RequestsController < ApplicationController
  before_action :set_request, only: [:accept, :decline]

  def create
    @pet = Pet.find(params[:pet_id])
    @request = Request.new(user_id: current_user.id, pet_id: @pet.id)

    if @request.save
      redirect_to @pet, notice: "Request sent!"
    else
      flash[:error] = "Failed to send request."
      redirect_to @pet
    end
  end

  def accept
    @request.accepted = true
    if @request.save
      redirect_to pets_path, notice: "Request accepted!"
    else
      flash[:error] = "Failed to accept request."
      redirect_back(fallback_location: root_path)
    end
  end


  def decline
    @request.accepted = false
    if @request.save
      redirect_to pets_path, notice: "Request declined."
    else
      flash[:error] = "Failed to decline request."
      redirect_back(fallback_location: root_path)
    end
  end


  private

  def set_request
    @request = Request.find(params[:id])
  end
end
