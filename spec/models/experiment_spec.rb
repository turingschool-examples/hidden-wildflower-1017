require 'rails_helper'

RSpec.describe Experiment, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:objective) }
    it { should validate_presence_of(:num_months) }
  end
  
  describe "relationships" do
    it { should have_many(:scientist_experiments) }
    it { should have_many(:scientists).through(:scientist_experiments)}
  end

  describe "class methods" do
    describe "#long_running" do
      it "returns experiments with num_months greater than 6 in order" do
        experiment1 = Experiment.create!(name: "Manhattan Project", objective: "Develop the first nuclear weapons", num_months: 36)
        experiment2 = Experiment.create!(name: "Trinity", objective: "Test the first nuclear weapons", num_months: 5)
        experiment3 = Experiment.create!(name: "MINERvA", objective: "Neutrino scattering", num_months: 12)
        experiment4 = Experiment.create!(name: "Neutronimator", objective: "Do cool things with Neutrons", num_months: 20)

        expect(Experiment.long_running).to eq([experiment1, experiment4, experiment3])
      end
    end
  end
end
