require "rails_helper"

RSpec.describe "the scientist show page" do
  it "shows scientists information, the name of the lab, and all experiments they are working on" do
    lab_1 = Lab.create(name: "Fermilab")
    scientist_1 = Scientist.create(name: "Marie Curie", specialty: "radioactivity", university: "University of Paris", lab: lab_1)
    experiment_1 = Experiment.create(name: "MINERvA", objective: "study neutrino reactions with five different nuclei", num_months: 4)
    experiment_2 = Experiment.create(name: "Radioactive-TV", objective: "is the TV radioactive?", num_months: 7)
    experiment_3 = Experiment.create(name: "Tree-Therapy", objective: "does the apple fall far from the tree?", num_months: 4)
    sci_exp_1 = ScientistExperiment.create(experiment: experiment_1, scientist: scientist_1)
    sci_exp_2 = ScientistExperiment.create(experiment: experiment_2, scientist: scientist_1)

    visit scientist_path(scientist_1)

    within(".scientist_info") do
      expect(page).to have_content("Scientist: #{scientist_1.name}")
      expect(page).to have_content("Specialty: #{scientist_1.specialty}")
      expect(page).to have_content("University: #{scientist_1.university}")
      expect(page).to have_content("Current Lab: #{scientist_1.lab.name}")
    end
    within(".experiments") do
      expect(page).to have_content(experiment_1.name)
      expect(page).to have_content(experiment_2.name)
      expect(page).to_not have_content(experiment_3.name)
    end
  end

  it "adds a button to delete an experiment from a scientists show page" do
    lab_1 = Lab.create(name: "Fermilab")
    scientist_1 = Scientist.create(name: "Marie Curie", specialty: "radioactivity", university: "University of Paris", lab: lab_1)
    scientist_2 = Scientist.create(name: "George", specialty: "radioactivity", university: "University of Paris", lab: lab_1)
    experiment_1 = Experiment.create(name: "MINERvA", objective: "study neutrino reactions with five different nuclei", num_months: 4)
    experiment_2 = Experiment.create(name: "Radioactive-TV", objective: "is the TV radioactive?", num_months: 7)
    experiment_3 = Experiment.create(name: "Tree-Therapy", objective: "does the apple fall far from the tree?", num_months: 4)
    sci_exp_1 = ScientistExperiment.create(experiment: experiment_1, scientist: scientist_1)
    sci_exp_2 = ScientistExperiment.create(experiment: experiment_2, scientist: scientist_1)
    sci_exp_2 = ScientistExperiment.create(experiment: experiment_2, scientist: scientist_2)

    visit scientist_path(scientist_1)

    within(".experiments") do
      expect(page).to have_content(experiment_1.name)
      expect(page).to have_content(experiment_2.name)
      expect(page).to_not have_content(experiment_3.name)
      expect(page).to have_button("Delete #{experiment_1.name}")
      expect(page).to have_button("Delete #{experiment_2.name}")
      click_button "Delete #{experiment_2.name}"
      visit scientist_path(scientist_1)
      expect(page).to_not have_content(experiment_2.name)
      expect(page).to_not have_content(experiment_3.name)
    end

    visit scientist_path(scientist_2)
    within(".experiments") do
      expect(page).to have_content(experiment_2.name)
      expect(page).to have_button("Delete #{experiment_2.name}")
    end
  end
end

