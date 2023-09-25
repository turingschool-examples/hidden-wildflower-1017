# require "rails_helper"

# RSpec.describe "the lab show page" do
#   describe "shows lab information, the names of all scientists that work at the lab" do
#     it "also shows the number of experiments the scientist is working on - scientists are ordered by number of experiments" do
#       lab_1 = Lab.create(name: "Fermilab")
#       scientist_1 = Scientist.create(name: "Marie Curie", specialty: "radioactivity", university: "University of Paris", lab: lab_1)
#       scientist_2 = Scientist.create(name: "George", specialty: "gravity", university: "University of Paris", lab: lab_1)
#       scientist_3 = Scientist.create(name: "Harry", specialty: "Theory", university: "University of Paris", lab: lab_1)
#       experiment_1 = Experiment.create(name: "MINERvA", objective: "study neutrino reactions with five different nuclei", num_months: 4)
#       experiment_2 = Experiment.create(name: "Radioactive-TV", objective: "is the TV radioactive?", num_months: 7)
#       experiment_3 = Experiment.create(name: "Tree-Therapy", objective: "does the apple fall far from the tree?", num_months: 4)
#       sci_exp_1 = ScientistExperiment.create(experiment: experiment_1, scientist: scientist_1)
#       sci_exp_2 = ScientistExperiment.create(experiment: experiment_2, scientist: scientist_1)
#       sci_exp_2 = ScientistExperiment.create(experiment: experiment_3, scientist: scientist_1)
#       sci_exp_2 = ScientistExperiment.create(experiment: experiment_1, scientist: scientist_3)
#       sci_exp_2 = ScientistExperiment.create(experiment: experiment_2, scientist: scientist_3)
#       sci_exp_2 = ScientistExperiment.create(experiment: experiment_3, scientist: scientist_2)

#       visit labs_path

#       expect(page).to have_content("#{scientist_1} - 3 current experiments")
#       expect(page).to have_content("#{scientist_2} - 1 current experiments")
#       expect(page).to have_content("#{scientist_3} - 2 current experiments")
#       expect("#{scientist_1} - 3 current experiments").to appear_before("#{scientist_3} - 2 current experiments")
#       expect("#{scientist_3} - 2 current experiments").to appear_before("#{scientist_2} - 1 current experiments")
#     end
#   end
# end

