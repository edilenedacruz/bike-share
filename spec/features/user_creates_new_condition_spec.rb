require_relative '../spec_helper'

RSpec.describe "User inputs weather conditions for a day" do

  it "saves the user input for weather conditions" do
    visit "/conditions/new"

    fill_in('condition[date]', with: "7/29/2013")
    fill_in('condition[max_temperature_f]', with: 55)
    fill_in('condition[mean_temperature_f]', with: 55)
    fill_in('condition[min_temperature_f]', with: 55)
    fill_in('condition[mean_humidity]', with: 55)
    fill_in('condition[mean_visibility_miles]', with: 55)
    fill_in('condition[mean_wind_speed_mph]', with: 55)
    fill_in('condition[precipitation_inches]', with: 55)
    click_button('Create Condition Report')

    save_and_open_page
    expect(page).to have_content("7/29/2013")
    expect(page).to have_content(55)
  end

end