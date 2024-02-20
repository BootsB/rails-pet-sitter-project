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
    check_selected_roles(profile_params[:role])
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to @profile, notice: "Profile successfully created!"
    else
      render :new
    end
  end

  def update
    if profile_params[:role].present?
      profile_params[:role] = [profile_params[:role]] # Convert the value to an array
    else
      profile_params.delete(:role) # Remove the parameter if it's empty
    end

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

  def check_selected_roles(roles)
    if roles.present?
      # Print out or log the selected roles
      Rails.logger.info "Selected roles: #{roles}"
    else
      # Handle the case where no roles are selected
      Rails.logger.info "No roles selected"
    end
  end

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    puts "Role Param: #{params[:role]}"
    params.require(:profile).permit(:first_name, :last_name, :phone_number, :description, :age, :photo, :role)
  end
end
