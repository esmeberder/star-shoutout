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
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.user = current_user
    @booking.service
    if @booking.save
      redirect_to bookings_path
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
    >>>>>>> d8402925081ebcf51cc8281490223e922172c119
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  <<<<<<< HEAD
  def service_params
    params.require(:service).permit(:accepted, :user_id, :service_id)
=======
    def booking_params
      params.require(:booking).permit(:accepted, :user_id, :service_id)
      >>>>>>> d8402925081ebcf51cc8281490223e922172c119
    end
  end
