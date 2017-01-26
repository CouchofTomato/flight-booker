class Flight < ApplicationRecord
  belongs_to :departing, class_name: "Airport"
  belongs_to :arriving, class_name: "Airport"
  has_many :bookings
  
  scope :dates, -> { select(:flight_date).map(&:flight_date) }

  def self.flight_dates
    self.dates.map {|date| date.to_date.strftime("%d,%m,%Y")}.uniq
  end
  
  def self.select_flights(args)
    date = Date.strptime(args[:date], "%d,%m,%Y").to_date
    Flight.where(departing: args[:departing], arriving: args[:arriving], flight_date: date.beginning_of_day..date.end_of_day)
  end
  
  def format_date
    self.flight_date.strftime("%d/%m/%Y")
  end

  def format_time
    self.flight_date.strftime("%I:%M %P")
  end
end
