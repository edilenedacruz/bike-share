require_relative '../spec_helper'

describe Bike do

  it "is not valid without an id" do
    Bike.create(name: "Suzi")

    expect(bike).to_not be_valid
  end

  it "is valid with an id" do
    Bike.create(id: 250)

    expect(bike).to be_valid
  end

end
