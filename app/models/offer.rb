class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :product_name, presence: true
  validates :category, presence: true
  validates :location, presence: true
  validates :price, presence: true
end
