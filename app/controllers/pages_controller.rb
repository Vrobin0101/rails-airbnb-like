class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :my_profile]

  def home
    @offers = Offer.select('DISTINCT ON (category) *')
  end

  def my_profile
  end
end
