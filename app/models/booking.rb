class Booking < ApplicationRecord
  belongs_to :flight
  has_many :bookings_passengers, inverse_of: :passenger
  has_many :passengers, through: :bookings_passengers
  accepts_nested_attributes_for :passengers
  accepts_nested_attributes_for :flight
end
