class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @pet = Pet.find(params[:pet_id])
    @owner = @pet.user
    @review = Review.new(review_params)
    @review.user = @owner
    if @review.save
      redirect_to pet_path(@pet), notice: 'Review was successfully created.'
    else
      redirect_to pet_path(@pet), alert: 'Failed to create review.'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
