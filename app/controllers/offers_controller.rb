class OffersController < ApplicationController
  before_action :set_offer, only: %i[show edit update destroy]
  before_action :offer_params, only: %i[create update]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @offers = policy_scope(Offer)
    if params[:query].present?
      @offers = Offer.where("category ILIKE ? OR product_name ILIKE ? OR location ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%")
    end
    @markers = @offers.geocoded.map do |offer|
      {
        lat: offer.latitude,
        lng: offer.longitude,
        info_window: render_to_string(partial: "info_window", locals: { offer: offer })
      }
    end
  end

  def show
    authorize @offer
    @booking = Booking.new
  end

  def new
    @offer = Offer.new
    authorize @offer
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    authorize @offer
    if @offer.save
      redirect_to offer_path(@offer)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @offer
  end

  def update
    @offer = Offer.update(offer_params)
    authorize @offer
    if @offer.save
      redirect_to offer_path(@offer)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @offer.destroy
    authorize @offer
    redirect_to offer_path, status: :see_other
  end

  private

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def offer_params
    params.require(:offer).permit(:product_name, :category, :location, :price, :photo, :description)
  end
end
