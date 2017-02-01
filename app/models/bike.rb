class Bike < ActiveRecord::Base

  has_many :trips

  def self.most_ridden_bike_with_total_rides_for_bike
    # Bike.min_by("bike_id").count
    ordered_bike_rides = Trip.group("bike_id").order("count_bike_id desc").count("bike_id")
    most_ridden = ordered_bike_rides.first
    most_ridden
  end

  def self.least_ridden_bike_with_total_rides_for_bike
    # min_by("bike_id").count
    ordered_bike_rides = Trip.group("bike_id").order("count_bike_id desc").count("bike_id")
    least_ridden = ordered_bike_rides.last
    least_ridden
  end

end
