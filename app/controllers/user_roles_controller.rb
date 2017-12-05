class UserRolesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :set_user_role, only: [:show, :update, :destroy]

  # GET /user_roles
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @user_roles = UserRole.where("user_id = ?", @user.id)
    elsif params[:role_id]
      @role = Role.find(params[:role_id])
      @user_roles = UserRole.where("role_id = ?", @role.id)
    else
      @user_roles = UserRole.all
    end

    render json: @user_roles
  end

  # GET /user_roles/1
  def show
    render json: @user_role
  end

  # POST /user_roles
  def create
    @user_role = UserRole.new(user_role_params)

    if @user_role.save
      render json: @user_role, status: :created, location: @user_role
    else
      render json: @user_role.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_roles/1
  def update
    if @user_role.update(user_role_params)
      render json: @user_role
    else
      render json: @user_role.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_roles/1
  def destroy
    @user_role.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_role
      @user_role = UserRole.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_role_params
      params.require(:user_role).permit(:user_id, :role_id)
    end
end
