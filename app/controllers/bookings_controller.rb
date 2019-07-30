class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    # @bookings = polic
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:accepted, :user_id, :service_id)
  end
end
