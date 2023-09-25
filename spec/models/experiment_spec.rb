require 'rails_helper'

RSpec.describe Experiment do
  it {should have_many(:scientist_experiments)}
  it {should have_many(:scientists).through(:scientist_experiments)}

  it "#self.long_term" do
    experiment1 = Experiment.create!(name: "Timmy", objective:"To grow", num_months: 10)
    experiment2 = Experiment.create!(name: "Doggo", objective:"To find snacks", num_months: 2)
    experiment3 = Experiment.create!(name: "Draco", objective:"Become a wizard", num_months: 60)

    expect(Experiment.long_term).to eq([experiment3, experiment1])
  end
end