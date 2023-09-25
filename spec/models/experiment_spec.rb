require 'rails_helper'

RSpec.describe Experiment, type: :model do 
  describe 'relationships' do
    it { should have_many(:scientist_experiments) }
    it { should have_many(:scientists).through(:scientist_experiments) }
  end

  describe 'class methods' do
    it "#sort_by_num_months_longer_than_six" do
    
      @experiment_1 = Experiment.create!(name: "Reanimation", objective: "Bring back the dead", num_months: 2)
      @experiment_2 = Experiment.create!(name: "Brain Transplant", objective: "Get a new brain in there", num_months: 4)
      @experiment_3 = Experiment.create!(name: "Personality Split", objective: "Split some personalities", num_months: 8)
      @experiment_4 = Experiment.create!(name: "General Relativity", objective: "Bring back the dead", num_months: 12)
      @experiment_5 = Experiment.create!(name: "Quantum Mechanics", objective: "Really difficult physics", num_months: 24)
      @experiment_6 = Experiment.create!(name: "String Theory", objective: "Really really difficult physics", num_months: 36)

      expect(Experiment.sort_by_num_months_longer_than_six).to eq([@experiment_6, @experiment_5, @experiment_4, @experiment_3])
    end 
  end
end