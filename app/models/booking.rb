class Booking < ApplicationRecord
  STATUS = %w[Pending Accepted Declined]

  belongs_to :user
  belongs_to :offer
  validates :status, acceptance: { accept: STATUS }
  validates :start_date, :end_date, presence: true
end
