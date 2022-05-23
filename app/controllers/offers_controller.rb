class OffersController < ApplicationController
  before_action :set_offer, only: %i[show edit update destroy]
  before_action :offer_params, only: %i[create update]

  def index
    @offers = Offer.all
  end

  def show() end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
  end

  def edit() end

  def update
    @offer = Offer.update(offer_params)
  end

  def destroy
    @offer.destroy
  end

  private

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def offer_params
    params.require(:offer).permit(:product_name, :category, :location, :price)
  end
end
