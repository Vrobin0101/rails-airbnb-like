class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit]
  before_action :set_offer, only: %i[new create edit update]
  # before_action :set_user, only: %i[edit update]

  def index
    @booking = Booking.all
  end

  def show() end

  def new
    @booking = Booking.new
    @booking.user = current_user
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.offer = @offer
    @booking.user = current_user
    if @booking.save
      redirect_to offer_path(@offer)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit() end

  def update
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_offer
    @offer = Offer.find(params[:offer_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
