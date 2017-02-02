require_relative '../spec_helper'

RSpec.describe Condition do
  it "is valid with all attributes" do
    condition = Condition.create(date: "11/02/2012",
                                 max_temperature_f: 12,
                                 mean_temperature_f: 55,
                                 min_temperature_f: 46,
                                 mean_humidity: 32,
                                 mean_visibility_miles: 21,
                                 mean_wind_speed_mph: 12,
                                 precipitation_inches: 0,
                                 )

    expect(condition).to be_valid
  end

  it "is not valid without a date" do
    condition = Condition.create(max_temperature_f: 12,
                                 mean_temperature_f: 55,
                                 min_temperature_f: 46,
                                 mean_humidity: 32,
                                 mean_visibility_miles: 21,
                                 mean_wind_speed_mph: 12,
                                 precipitation_inches: 0,
                                 )

    expect(condition).to_not be_valid
  end
end