require 'csv'
require './app/models/station.rb'
require './app/models/trip.rb'
require './app/models/condition.rb'
require './app/models/bike.rb'

CSV.foreach('db/csv/trip.csv', :headers=> true) do |row|

  bike = Bike.find_or_create_by(id: row["bike_id"])
  Station.find_or_create_by(name: row["name"])

  Trip.create!({
  duration: row["duration"],
  start_date: row["start_date"],
  start_station_name: row["start_station_name"],
  start_station_id: row["start_station_id"],
  end_date: row["end_date"],
  end_station_name: row["end_station_name"],
  end_station_id: row["end_station_id"],
  bike_id: bike.id,
  subscription: row["subscription_type"],
  zipcode: row["zip_code"]})
end

CSV.foreach('db/csv/station.csv', :headers=> true) do |row|
  Station.create!({
    name: row["name"],
    dock_count: row["dock_count"],
    city: row["city"],
    installation_date: row["installation_date"]})
end

CSV.foreach('db/csv/weather.csv', :headers => true) do |row|

  Condition.create!({
    date: row["date"],
    mean_temperature_f: row["mean_temperature_f"],
    min_temperature_f: row["min_temperature_f"],
    mean_humidity: row["mean_humidity"],
    mean_visibility_miles: row["mean_visibility_miles"],
    mean_wind_speed_mph: row["mean_wind_speed_mph"],
    precipitation_inches: row["precipitation_inches"]})
end
