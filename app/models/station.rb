class Station < ActiveRecord::Base
  validates :name, presence: true
  validates :dock_count, presence: true
  validates :city, presence: true
  validates :installation_date, presence: true

  def self.total_count_of_stations
    all.count
  end

  def self.average_bikes_available_per_station
    average("dock_count").round(2)
  end

  def self.most_recently_installed_station
    minimum("installation_date")
  end

  def self.oldest_station
    maximum("installation_date")
  end

  def self.minimum_dock_count
    minimum("dock_count")
  end

  def self.maximum_dock_count
    maximum("dock_count")
  end
end
