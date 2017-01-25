class CreateFlights < ActiveRecord::Migration[5.0]
  def change
    create_table :flights do |t|
      t.references :departing, foreign_key: true
      t.references :arriving, foreign_key: true
      t.datetime :flight_date
      t.float :flight_duration

      t.timestamps
    end
  end
end
