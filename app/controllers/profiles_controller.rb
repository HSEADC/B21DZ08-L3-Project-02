class ProfilesController < ApplicationController
  load_and_authorize_resource
  before_action :set_profile, only: %i[ show edit update destroy ]

  def show
    @profile = Profile.find(params[:id]) 
    @plants = @profile.user.plants
    @ideas = @profile.user.ideas
    @shelves = @profile.user.shelves
    @followers = @profile.user.followers
    @followings = @profile.user.following_users
  end

  def edit
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profile_url(@profile), notice: "Profile was successfully updated." }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:username, :about, :location, :user_id, :profile_image)
    end
end