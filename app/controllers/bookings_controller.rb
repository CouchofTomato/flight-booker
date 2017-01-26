class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight][:flight_id])
    @booking = Booking.new(flight: @flight)
    @number = params[:people].to_i
    @passenger = Array.new(@number) { @booking.passengers.build }
  end

  def create
  end

  def show
  end
end
