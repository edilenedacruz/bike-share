require_relative '../spec_helper'

RSpec.describe Station do
  it "is valid with all attributes" do
    station = Station.create(name: "B-cycle", dock_count: 12, city: "Denver", installation_date: "12-12-12")

    expect(station).to be_valid
  end

  it "is not valid without a name" do
    station = Station.create(dock_count: 12, city: "Denver", installation_date: "12-12-12")

    expect(station).to_not be_valid
  end

  it "is not valid without a dock count" do
    station = Station.create(name: "B-cycle", city: "Denver", installation_date: "12-12-12")

    expect(station).to_not be_valid
  end

  it "is not valid without a city" do
    station = Station.create(name: "B-cycle", dock_count: 12, installation_date: "12-12-12")

    expect(station).to_not be_valid
  end

  it "is not valid without a installation date" do
    station = Station.create(name: "B-cycle", dock_count: 12, city: "Denver")

    expect(station).to_not be_valid
  end 
end
