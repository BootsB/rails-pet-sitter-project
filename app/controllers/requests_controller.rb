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

end
