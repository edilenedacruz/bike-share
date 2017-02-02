require_relative '../spec_helper'

RSpec.describe "User deletes a weather condition" do

  it "deletes the selected weather condition from conditions index" do
    Condition.create(
                     date: "2/2/2012",
                     max_temperature_f: 2,
                     mean_temperature_f: 2,
                     min_temperature_f: 2,
                     mean_humidity: 2,
                     mean_visibility_miles: 2,
                     mean_wind_speed_mph: 2,
                     precipitation_inches: 2
                     )
    visit "/conditions"
    click_button('Delete')

    #save_and_open_page
    expect(page).not_to have_content("2/2/2012")
  end

end