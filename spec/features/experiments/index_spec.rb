require "rails_helper"

RSpec.describe "the Experiments Index page" do
  it "shows all experiments that have run longer than 6 months, and I see the names in descending order" do
    lab_1 = Lab.create(name: "Fermilab")
    scientist_1 = Scientist.create(name: "Marie Curie", specialty: "radioactivity", university: "University of Paris", lab: lab_1)
    experiment_1 = Experiment.create(name: "MINERvA", objective: "study neutrino reactions with five different nuclei", num_months: 4)
    experiment_2 = Experiment.create(name: "Radioactive-TV", objective: "is the TV radioactive?", num_months: 8)
    experiment_3 = Experiment.create(name: "Tree-Therapy", objective: "does the apple fall far from the tree?", num_months: 7)
    experiment_4 = Experiment.create(name: "Apple-Theory", objective: "does the apple fall far from the tree?", num_months: 9)
    sci_exp_1 = ScientistExperiment.create(experiment: experiment_1, scientist: scientist_1)
    sci_exp_2 = ScientistExperiment.create(experiment: experiment_2, scientist: scientist_1)

    visit experiments_path

    expect(page).to have_content("#{experiment_2.name}: running #{experiment_2.num_months} months")
    expect(page).to have_content("#{experiment_3.name}: running #{experiment_3.num_months} months")
    expect(page).to have_content("#{experiment_4.name}: running #{experiment_4.num_months} months")
    expect(page).to_not have_content(experiment_1.name)
    expect("#{experiment_4.name}: running #{experiment_4.num_months} months").to appear_before("#{experiment_2.name}: running #{experiment_2.num_months} months")
    expect("#{experiment_2.name}: running #{experiment_2.num_months} months").to appear_before("#{experiment_3.name}: running #{experiment_3.num_months} months")
  end
end

