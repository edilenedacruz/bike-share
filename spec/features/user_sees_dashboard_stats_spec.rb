require_relative '../spec_helper'

describe "When a user visits station-dashboard" do
  it "they see total count of stations" do
    Station.create(name: "Stanfor",
      dock_count: 2,
      city: "San Francisc",
      installation_date: "1/12/12")
    Station.create(name: "Stan",
      dock_count: 3,
      city: "San Fran",
      installation_date: "12/11/12")
    Station.create(name: "Stanford",
      dock_count: 1,
      city: "San Francisco",
      installation_date: "12/12/11")

      expect(page).to have_content("Total count of stations: 3")

  end
  #
  # bike = Bike.create
  # condition = Condition.create(date: "4/4/4")
  # start_station = Station
  #                   .create(name: "Stanford",
  #                   dock_count: 1,
  #                   city: "San Francisco",
  #                   installation_date: "12/12/12")
  # end_station = Station
  #                 .create(name: "Tenderloin",
  #                 dock_count: 4,
  #                 city: "San Francisco",
  #                 installation_date: "12/12/12")
  # trip = Trip
  #         .create(duration: 123,
  #         start_date: "1/2/3",
  #         end_date: "1/2/4",
  #         subscription: "Brandon",
  #         zipcode: "98888",
  #         start_station_id: start_station.id,
  #         end_station_id: end_station.id,
  #         bike_id: bike.id,
  #         condition_id: condition.id
  #           )

end
