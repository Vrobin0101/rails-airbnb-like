class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :product_name, presence: true
  validates :category, presence: true
  validates :location, presence: true
  validates :price, presence: true
  scope :filter_by_category, ->(category) { where category: category }
  scope :filter_by_location, ->(location) { where location: location }
  scope :filter_by_starts_with, ->(product_name) { where("product_name like ?", "#{product_name}%") }
end
