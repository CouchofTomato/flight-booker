class Airport < ApplicationRecord
  has_many :arrivals, class_name: "Flight"
end
