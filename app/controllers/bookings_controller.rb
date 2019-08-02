class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = policy_scope(Booking)
  end

  # def star
  #   @star = @booking.service.user
  # end

  # def customer
  #   @customer = @booking.user
  # end

  def show
    authorize @booking
  end

  def new
    @booking = Booking.new
    authorize @booking
    @service = Service.find(params[:service_id])
  end

  def create
    @booking = Booking.new(booking_params_users)
    @service = Service.find(params[:service_id])
    authorize @booking
    @booking.user = current_user
    @booking.service_id = @service.id
    if @booking.save
      redirect_to user_dashboard_path
    else
      render :new
    end
  end

  def edit
    authorize @booking
  end

  def update
    authorize @booking
    redirect_to star_dashboard_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params_users
    params.require(:booking).permit(:recipient, :instructions, :user_id, :service_id)
  end

  def booking_params_stars
    params.require(:booking).permit(:recipient, :instructions, :accepted, :user_id, :service_id, :video)
  end
end
