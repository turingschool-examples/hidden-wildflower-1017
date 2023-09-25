require 'rails_helper'

RSpec.describe Scientist do
  describe "relationships" do
    it {should belong_to :lab}
    it {should have_many :experiment_scientists}
    it {should have_many(:experiments).through(:experiment_scientists)}
  end

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :specialty}
    it {should validate_presence_of :university}
  end

  describe "all_experiments" do
    it "Creates an array of experiment objects that a scientist is currently working on" do
      lab1 = Lab.create!(name: "Baylor's Science Lab")
      scientist1 = Scientist.create!(name: "Bill", specialty: "Anatomy", university: "Baylor", lab: lab1)
      experiment1 = Experiment.create!(name: "Muscle Test", objective: "To test muscles", num_months: 1)
      experiment2 = Experiment.create!(name: "Cell Test", objective: "To test cells", num_months: 2)
      experiment3 = Experiment.create!(name: "PH Test", objective: "To test PH levels", num_months: 3)
      experiment_scientist1 = ExperimentScientist.create!(experiment: experiment1, scientist: scientist1)
      experiment_scientist2 = ExperimentScientist.create!(experiment: experiment2, scientist: scientist1)
      
      scientist1_experiments = scientist1.all_experiments
      
      expect(scientist1_experiments).to match_array([experiment1, experiment2])
      expect(scientist1_experiments).to_not include(experiment3)
    end
  end
end