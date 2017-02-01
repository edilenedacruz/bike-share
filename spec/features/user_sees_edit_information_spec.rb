require_relative '../spec_helper'

RSpec.describe "When a user visits edit page" do
  it "they see option to edit trip" do
    trip = Trip.create(duration: 600,
                       start_date: "01/01/2017",
                       start_station_id: "Denver",
                       end_date: "01/01/2017",
                       end_station_id: "Lakewood",
                       bike_id: "444",
                       subscription: "customer")
    save_and_open_page
    within('h1') do
      expect(page).to have_content("Edit your trip")
    end
  end
end
