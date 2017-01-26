class Airport < ApplicationRecord
  has_many :arrivals, foreign_key: "arriving_id", class_name: "Flight"
  has_many :departures, foreign_key: "departing_id", class_name: "Flight"
  
  def name_and_code
    "#{self.name} (#{self.code})"
  end
end
