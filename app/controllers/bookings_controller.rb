class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = policy_scope(Booking)
  end

  def show
  end

  def new
    @booking = Booking.new
    authorize @booking
    @service = Service.find(params[:service_id])

  end

  def create
    @booking = Booking.new(booking_params)
    @service = Service.find(params[:service_id])
    authorize @booking
    @booking.user = current_user
    @booking.service_id = @service.id
    if @booking.save
      redirect_to service_bookings_path
    else
      render :new
    end
  end

  def edit
    authorize @booking
  end

  def update
    authorize @booking
    if @booking.update(booking_params)
      redirect_to bookings_path
    else
      render :edit
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:recipient, :instructions, :accepted, :user_id, :service_id)
  end
end
