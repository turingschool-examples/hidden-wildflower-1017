require 'rails_helper'

RSpec.describe Experiment, type: :model do
  describe "realtionships" do
    it { should have_many :scientist_experiments }
    it { should have_many(:scientists).through(:scientist_experiments) }
  end

  describe "#long_running" do
    it "returns experiments longer than 6 months" do
      @experiment_1 = Experiment.create!(name: "MINERvA", objective: "study neutrino reactions with five different nuclei", num_months: 4)
      @experiment_2 = Experiment.create!(name: "MINERaL", objective: "study minerals in the CA redwoods", num_months: 5)
      @experiment_3 = Experiment.create!(name: "Rockwell", objective: "study rocks in the CA redwoods", num_months: 10)
      @experiment_4 = Experiment.create!(name: "Galaxies", objective: "study the galaxies in the universe", num_months: 12)

      long_running_experiments = Experiment.long_running

      expect(long_running_experiments).to include(@experiment_3)
      expect(long_running_experiments).to include(@experiment_4)
      expect(long_running_experiments).not_to include(@experiment_1)
      expect(long_running_experiments).not_to include(@experiment_2)
    end
  end
end
