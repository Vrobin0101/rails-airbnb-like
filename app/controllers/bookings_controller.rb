class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update accept decline]
  before_action :set_offer, only: %i[new create edit update]
  before_action :set_user, only: %i[new create]
  def index
    @booking = Booking.all
  end

  def show() end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.offer = @offer
    @booking.user = @user
    if @booking.save
      redirect_to my_bookings_path, notice: 'Your booking is being processed'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit() end

  def update
    @booking.update(booking_params)
    redirect_to offer_path(@offer)
  end

  def accept
    @booking.update(status: 'accepted')
  end

  def decline
    @booking.update(status: 'declined')
  end

  private

  def set_user
    @user = current_user
  end

  def set_offer
    @offer = Offer.find(params[:offer_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
