class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map {|a| [a.name_and_code, a.id] }
    @dates = Flight.flight_dates.map {|d| [d, d] }
    @numbers = (1..4).map {|n| Array.new([n,n]) }
    
    if params[:departing_id]
      @flights = Flight.select_flights(departing: params[:departing_id], arriving: params[:arriving_id],
                                        date: params[:flight_date])
    end
  end
end
