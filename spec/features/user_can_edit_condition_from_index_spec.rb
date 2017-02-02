require_relative '../spec_helper'

RSpec.describe "User pushes button to edit condition on condition index" do

  it "updates the selected condition" do
    Condition.create(date: "2/2/2012",
                     max_temperature_f: 8,
                     mean_temperature_f: 2,
                     min_temperature_f: 2,
                     mean_humidity: 2,
                     mean_visibility_miles: 2,
                     mean_wind_speed_mph: 2,
                     precipitation_inches: 2)
    visit "/conditions"
    click_button('Edit')

    fill_in 'condition[max_temperature_f]', with: 9

    click_button('Update Condition Report')

    save_and_open_page
    expect(page).not_to have_content(8)
    expect(page).to have_content(9)
    #expect(current_path).to eq("/conditions/#{@condition.id}")
  end

end