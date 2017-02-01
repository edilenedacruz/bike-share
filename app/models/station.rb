class Station < ActiveRecord::Base

  belongs_to :trip

  validates :name, presence: true
  validates :dock_count, presence: true
  validates :city, presence: true
  validates :installation_date, presence: true

  def self.total_count_of_stations
    count
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
    where(dock_count: fewest_bikes_available_at_a_station)
  end

  def self.maximum_dock_count_name
    where(dock_count: most_bikes_available_at_a_station)
  end

  def self.most_recently_installed_station
    minimum("installation_date")
  end

  def self.oldest_station
    maximum("installation_date")
  end

end
