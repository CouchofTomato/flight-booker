# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Airport.delete_all
Flight.delete_all

airport_codes = [
  [["LHR"], ["London Heathrow"]],
  [["JFK"], ["John Kennedy New York"]],
  [["DMK"], ["Dong Muang Airport Bangkok"]],
  [["MLB"], ["Orlando Melbourne Airport"]],
  [["PEK"], ["Beijing Capital International"]],
  [["HND"], ["Haneda Airport Tokyo"]],
  [["LAX"], ["Los Angeles International"]],
  [["DXB"], ["Dubai International Airport"]],
  [["AMS"], ["Amsterdam Airport"]],
  [["IST"], ["Istanbul International Airport"]]
]

airport_codes.each do |code, name|
  Airport.create(code: code, name: name)
end

4.times do #4 flights a day
  day = 1
  21.times do #3 weekss worth of flights
    (1..10).each do |departure|
      (1..10).each do |destination|
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
