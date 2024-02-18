class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:edit, :update, :destroy]

  def show
    @profile = Profile.find_by(id: params[:id])
    unless @profile
      flash[:error] = "Profile not found"
      redirect_to root_path
    end
  end

  def new
    if current_user.profile.present?
      redirect_to edit_profile_path(current_user.profile)
    else
      @profile = current_user.build_profile
    end
  end

  def edit
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to @profile, notice: "Profile successfully created!"
    else
      render :new
    end
  end

  def update
    if @profile.update(profile_params)
      redirect_to root_path, notice: "Profile successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    if @profile.destroy
      flash[:notice] = "Profile successfully deleted."
      redirect_to new_profile_path, notice: "Please create a new profile."
    else
      flash[:error] = "Failed to delete profile."
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :phone_number, :description, :age)
  end
end
