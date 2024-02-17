class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:edit, :update]

  def show
    @profile = User.find(params[:id]).profile
  end

  def new
    if current_user.profile.present?
      redirect_to edit_profile_path(current_user.profile)
    else
      @profile = current_user.build_profile
    end
  end

  def edit
    @profile = current_user.profile || current_user.build_profile
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to root_path, notice: "Profile successfully created!"
    else
      render :new
    end
  end

  def update
    @profile = current_user.profile
    if @profile.update(profile_params)
      redirect_to root_path, notice: "Profile successfully updated!"
    else
      render :edit
    end
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :phone_number, :address, :description)
  end
end
