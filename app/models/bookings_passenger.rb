class BookingsPassenger < ApplicationRecord
  belongs_to :booking
  belongs_to :passenger
  accepts_nested_attributes_for :passenger
end
