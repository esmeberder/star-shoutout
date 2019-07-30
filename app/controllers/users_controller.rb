class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = policy_scope(User).where(star: true)
  end

  def show
    authorize @user
    @services = @user.services
    @bookings = @user.bookings
  end

  # def edit
  #   authorize @user
  # end

  # def update
  #   authorize @user
  #   if @user.update(user_params)
  #     redirect_to user_path(@user)
  #   else
  #     render :edit
  #   end
  # end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :bio, :star, :photo)
  end
end
