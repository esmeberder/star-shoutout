class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @users = policy_scope(User).where(star: true)
  end

  def show
    authorize @user
    @services = @user.services
    @bookings = @user.bookings
  end

  def dashboard
    @user = current_user
    authorize @user
    @bookings = @user.bookings
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :bio, :star, :photo)
  end
end
