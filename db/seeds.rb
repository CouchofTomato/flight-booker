# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Airport.delete_all
Flight.delete_all

Airport.create!(name: "London Heathrow", code: "LHR")
Airport.create!(name: "John Kennedy New York", code: "JFK")
Airport.create!(name: "Dong Muang Airport Bangkok", code: "DMK")
Airport.create!(name: "Orlando Melbourne Airport", code: "MLB")
Airport.create!(name: "Beijing Capital International", code: "PEK")
Airport.create!(name: "Haneda Airport Tokyo", code: "HND")
Airport.create!(name: "Los Angeles International", code: "LAX")
Airport.create!(name: "Dubai International Airport", code: "DXB")
Airport.create!(name: "Amsterdam Airport", code: "AMS")
Airport.create!(name: "Istanbul International Airport", code: "IST")


airports = Airport.all

4.times do #4 flights a day
  day = 1
  21.times do #3 weekss worth of flights
    airports.all.each do |departure|
      airports.all.each do |destination|
        duration = "#{rand(1..12)}:#{rand(0..59)}:00"
        date = Faker::Time.between((DateTime.now + day), (DateTime.now + day)) 
        if destination != departure
          Flight.create!(departing: departure, arriving: destination, flight_date: date, flight_duration: duration)
        end
      end
    end
    day += 1
  end
end
