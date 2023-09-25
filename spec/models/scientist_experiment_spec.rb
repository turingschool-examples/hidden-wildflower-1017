require 'rails_helper'

RSpec.describe ScientistExperiment do
  before :each do 
    @experiment = Experiment.create!(name: "MINERvA", description: "study neutrino reactions with five different nuclei", num_months: 4)
    @experiment_2 = Experiment.create!(name: "Experiment 2", description: "study two", num_months: 4)
    @experiment_3 = Experiment.create!(name: "Experiment 3", description: "study three", num_months: 20)
    @experiment_4 = Experiment.create!(name: "Experiment 4", description: "study four", num_months: 10)
    @experiment_5 = Experiment.create!(name: "Experiment 5", description: "study five", num_months: 5)
  end

  describe "relationships" do
    it { should belong_to(:scientist) }
    it { should belong_to(:experiment) }
  end

  describe "#long_experiments" do
    it "shows experiments longer than 6 months in descending order" do
      long_experiments = Experiment.long_experiments
      expect(long_experiments).to eq([@experiment_3, @experiment_4])
    end
  end
end