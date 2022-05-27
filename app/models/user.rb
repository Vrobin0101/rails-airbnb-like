class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :offers, dependent: :destroy
  has_many :bookings, dependent: :destroy
  validates :username, uniqueness: true
  validates :first_name, :last_name, :username, presence: true

  # has_many :requests, through: :bookings, source: :offer

  has_many :rented_offers, through: :offers, source: :bookings
   # renvoyer les bookings qui me sont fait
  # validates :offers, uniqueness: true // Idk for this line
  # validates :bookings, uniqueness: true // Idk for this line
end
