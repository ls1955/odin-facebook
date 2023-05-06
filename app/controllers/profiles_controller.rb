class ProfilesController < ApplicationController
  include ActiveStorage::SetCurrent

  before_action :set_profile, %i[show edit update]

  def show
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.build_profile profile_params

    if @profile.save
      redirect_to profile_path(@profile), notice: "Profile has been succesfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @profile.update profile_params
      redirect_to profile_path(@profile), notice: "Profile was successfully updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:profile_picture, :biography)
  end
end
