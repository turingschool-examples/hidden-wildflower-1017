require "rails_helper"

RSpec.describe Experiment, type: :model do
  describe "relationships" do
    it { should have_many(:scientist_experiments) }
    it { should have_many(:scientists).through(:scientist_experiments) }
  end

  describe "class methods" do
    describe "#long_running" do
      it "returns experiments with num_months greater than 6 in order" do
        experiment_1 = Experiment.create!(name: "Proton Vis", objective: "Plot proton decay paths", num_months: 9)
        experiment_2 = Experiment.create!(name: "Muon Count", objective: "Measure Muon creation rate", num_months: 2)
        experiment_3 = Experiment.create!(name: "Positron STABL", objective: "Detect positron spin changes", num_months: 22)
        experiment_4 = Experiment.create!(name: "Charm", objective: "Force color of charm quarks", num_months: 15)

        expect(Experiment.long_running).to eq([experiment_3, experiment_4, experiment_1])
      end
    end
  end
end