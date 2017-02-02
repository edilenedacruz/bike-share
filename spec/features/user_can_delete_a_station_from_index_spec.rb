require_relative '../spec_helper'

RSpec.describe "User deletes a station" do

  it "deletes the selected station from stations index" do
    Station.create(
                   name: "Golden Gate",
                   dock_count: 15,
                   city: "San Francisco",
                   installation_date: "2/18/2010",
                  )
    visit "/stations"
    click_button('Delete')

    #save_and_open_page
    expect(page).not_to have_content("Golden Gate")
  end

end
