class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :set_user_role, only: [:show, :update, :destroy]

  # GET /profiles
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @profiles = Profile.where("user_id = ?", @user.id)
    elsif params[:role_id]
      @role = Role.find(params[:role_id])
      @profiles = Profile.where("role_id = ?", @role.id)
    else
      @profiles = Profile.all
    end

    render json: @profiles
  end

  # GET /profiles/1
  def show
    render json: @profile
  end

  # POST /profiles
  def create
    @profile = Profile.new(profile_params)

    if @profile.save
      render json: @profile, status: :created, location: @profile
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /profiles/1
  def update
    if @profile.update(profile_params)
      render json: @profile
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  # DELETE /profiles/1
  def destroy
    @profile.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def profile_params
      params.require(:profile).permit(:user_id, :role_id)
    end
end
