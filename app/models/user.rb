class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :offers
  has_many :bookings
  validates :username, uniqueness: true
  validates :first_name, :last_name, :username, presence: true
  # validates :offers, uniqueness: true // Idk for this line
  # validates :bookings, uniqueness: true // Idk for this line
end
