class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight][:flight_id])
    @booking = Booking.new(flight: @flight)
    @number = params[:people].to_i
    @passenger = Array.new(@number) { @booking.passengers.build }
  end

  def create
    @booking = Booking.create(flight_id: params[:booking][:flight], email: params[:booking][:email])
    params[:booking][:passenger].each do |passenger|
      @booking.passengers.create(name: passenger[:name])
    end
    
    redirect_to @booking
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
    @passengers = @booking.passengers
  end
  
  private
  
  def booking_params
    params.require(:booking).permit(:email, :flight, passenger: [:name])
  end
end
