require 'rails_helper'

RSpec.describe Experiment do
  describe "relationships" do
    it {should have_many :experiment_scientists}
    it {should have_many(:scientists).through(:experiment_scientists)}
  end

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :objective}
    it {should validate_presence_of :num_months}
  end

  describe "long_experiments" do
    it "returns an array of experiment objects that have the attribute 'num_months' longer than 6 ordered from longest to shortest" do
      experiment1 = Experiment.create!(name: "Muscle Test", objective: "To test muscles", num_months: 1)
      experiment2 = Experiment.create!(name: "Cell Test", objective: "To test cells", num_months: 2)
      experiment3 = Experiment.create!(name: "PH Test", objective: "To test PH levels", num_months: 3)
      experiment4 = Experiment.create!(name: "Orbit Test", objective: "To test palentary orbit", num_months: 7)
      experiment5 = Experiment.create!(name: "Molecular Structure Test", objective: "To test the structure of molecules", num_months: 8)
      experiment6 = Experiment.create!(name: "Breath Test", objective: "How long can you hold your breath", num_months: 9)

      long_experiments = Experiment.long_experiments 

      expect(long_experiments).to eq([experiment6, experiment5, experiment4])
      expect(long_experiments).to_not include(experiment1, experiment2, experiment3)
    end
  end
end