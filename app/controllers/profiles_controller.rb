class ProfilesController < ApplicationController
  include ActiveStorage::SetCurrent

  def show
    @profile = current_user.profile
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

  private

  def profile_params
    params.require(:profile).permit(:profile_picture, :biography)
  end
end