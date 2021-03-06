class UsersController < ApplicationController
  before_action :set_user, only: :show
  skip_after_action :verify_authorized, only: :tagged
  before_action :authenticate_user!, except: [:index, :tagged]

  def index
    @users = policy_scope(User)
    if params[:query].present?
      @users = User.global_search(params[:query])
    else
      @users = User.where(star: true)
    end
  end

  def show
    authorize @user
    @services = @user.services
    @bookings = @user.bookings
    @related_stars = @user.find_related_tags
  end

  def tagged
    if params[:tag].present?
      @users = User.tagged_with(params[:tag])
    else
      @users = policy_scope(User).where(star: true)
    end
  end

  def user_dashboard
    @user = current_user
    authorize @user
    @bookings = @user.bookings
    @new_bookings = @bookings.where(accepted: nil)
    @accepted_bookings = @bookings.where(accepted: true)
    @rejected_bookings = @bookings.where(accepted: false)
  end

  def star_dashboard
    @user = current_user
    authorize @user
    @bookings = []
    @user.services.each do |service|
      service.bookings.each do |booking|
        @bookings << booking
      end
    end
    @bookings
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :bio, :star, :photo, tag_list: [])
  end
end
