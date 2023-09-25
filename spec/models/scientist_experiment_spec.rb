require 'rails_helper'

RSpec.describe ScientistExperiment do
  it {should belong_to :scientist}
  it {should belong_to :experiment}

  describe "#find_entry" do
    it "allows us to find the entry by scientist_id and experiment_id" do
      lab_1 = Lab.create(name: "Fermilab")
      scientist_1 = Scientist.create(name: "Marie Curie", specialty: "radioactivity", university: "University of Paris", lab: lab_1)
      experiment_1 = Experiment.create(name: "MINERvA", objective: "study neutrino reactions with five different nuclei", num_months: 4)
      experiment_2 = Experiment.create(name: "Radioactive-TV", objective: "is the TV radioactive?", num_months: 7)
      experiment_3 = Experiment.create(name: "Tree-Therapy", objective: "does the apple fall far from the tree?", num_months: 4)
      sci_exp_1 = ScientistExperiment.create(experiment: experiment_1, scientist: scientist_1)
      sci_exp_2 = ScientistExperiment.create(experiment: experiment_2, scientist: scientist_1)

      expect(ScientistExperiment.find_entry(scientist_1.id, experiment_1.id)).to eq([sci_exp_1])
    end
  end
end