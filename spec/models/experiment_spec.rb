require 'rails_helper'

RSpec.describe Experiment do
  it {should have_many :scientist_experiments}
  it {should have_many(:scientists).through(:scientist_experiments) }

  describe "#over_6_months" do
    it "shows only experiments that are over 6 months, ordered by longest to shortest" do
      lab_1 = Lab.create(name: "Fermilab")
      scientist_1 = Scientist.create(name: "Marie Curie", specialty: "radioactivity", university: "University of Paris", lab: lab_1)
      experiment_1 = Experiment.create(name: "MINERvA", objective: "study neutrino reactions with five different nuclei", num_months: 9)
      experiment_2 = Experiment.create(name: "Radioactive-TV", objective: "is the TV radioactive?", num_months: 7)
      experiment_3 = Experiment.create(name: "Tree-Therapy", objective: "does the apple fall far from the tree?", num_months: 8)
      experiment_4 = Experiment.create(name: "Tree-Therapy", objective: "does the apple fall far from the tree?", num_months: 2)
      sci_exp_1 = ScientistExperiment.create(experiment: experiment_1, scientist: scientist_1)
      sci_exp_2 = ScientistExperiment.create(experiment: experiment_2, scientist: scientist_1)
      expect(Experiment.over_6_months).to eq([experiment_1, experiment_3, experiment_2])
    end
  end
end
