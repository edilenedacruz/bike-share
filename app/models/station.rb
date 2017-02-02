class Station < ActiveRecord::Base
  has_many :trips


  validates :name, presence: true
  validates :dock_count, presence: true
  validates :city, presence: true
  validates :installation_date, presence: true

  def self.total_count_of_stations
    all.count
  end

  def self.average_bikes_available_per_station
    average("dock_count").round
  end

  def self.most_bikes_available_at_a_station
    maximum("dock_count")
  end

  def self.fewest_bikes_available_at_a_station
    minimum("dock_count")
  end

  def self.minimum_dock_count_name
    where(dock_count: Station.fewest_bikes_available_at_a_station)
  end

  def self.maximum_dock_count_name
    where(dock_count: Station.most_bikes_available_at_a_station)
  end

  def self.most_recently_installed_station
    minimum("installation_date")
  end

  def self.oldest_station
    maximum("installation_date")
  end

  def self.rides_started_at_this_station
    require 'pry'; binding.pry
    a = Station
    Trip.where(start_station_name: @station.name).count
  end

  # def self.rides_ended_at_this_station
    # Trip.all.where(end_station_id: @station.id or name).count
  # end

  # def self.most_frequent_destination_station_for_rides_that_began_at_given_station
  #   Trip.all.
  # end
  #
  # def self.most_frequent_origination_station_for_rides_that_ended_at_given_station
  #
  # end

  # def self.date_with_highest_numbers_of_trips_started_at_given_station
  #
  # end
  #
  # def self.frequent_zip_code_for_starting_trips_at_given_station
  #
  # end

  # def self.bike_id_most_frequently_starting_a_trip_at_given_station
  #
  # end


end
