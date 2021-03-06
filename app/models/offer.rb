class Offer < ApplicationRecord
  CATEGORY = %w[badminton tennis football basketball rowing hockey paragliding ski]

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :product_name, :category, :location, :price, :description, :photo, presence: true
  scope :filter_by_category, ->(category) { where category: category }
  scope :filter_by_location, ->(location) { where location: location }
  scope :filter_by_starts_with, ->(product_name) { where("product_name like ?", "#{product_name}%") }

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
