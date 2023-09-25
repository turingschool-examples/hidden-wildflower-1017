require 'rails_helper'

RSpec.describe Experiment, type: :model do
  it {should have_many :scientist_experiments}
  it {should have_many(:scientists).through(:scientist_experiments)}

  describe "instance methods" do
    describe "#scientist_experiment(scientist)" do
      it "When you pass in a scientist object, it returns the ScientistExperiement object, if any" do
        lab = Lab.create!(name: "Laboratory")
        scientist = Scientist.create!(name: "Scientist", specialty: "Science", university: "GoodU", lab_id: lab.id)
        experiment1 = Experiment.create!(name: "Experiment 1", objective: "Learn Things", num_months: 12)
      
        scientist_experiment = ScientistExperiment.create!(scientist_id: scientist.id, experiment_id: experiment1.id)

        expect(experiment1.scientist_experiment(scientist)).to eq(scientist_experiment)
      end
    end
  end

  describe "class methods" do
    describe "#long_running" do
      it "looks at all experiments and returns any longer than 6 months, in descending order" do
        experiment1 = Experiment.create!(name: "Experiment 1", objective: "Learn Things", num_months: 24)
        experiment2 = Experiment.create!(name: "Experiment 2", objective: "Learn Less Things", num_months: 3)
        experiment3 = Experiment.create!(name: "Experiment 3", objective: "Learn Some Things", num_months: 12)
        experiment4 = Experiment.create!(name: "Experiment 4", objective: "Don't Learn Things", num_months: 64)
        experiment5 = Experiment.create!(name: "Experiment 5", objective: "Look at Things", num_months: 5)

        expect(Experiment.long_running).to eq([experiment4, experiment1, experiment3])
      end
    end
  end
end