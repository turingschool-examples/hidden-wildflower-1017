# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
lab_1 = Lab.create(name: "Fermilab")
scientist_1 = Scientist.create(name: "Marie Curie", specialty: "radioactivity", university: "University of Paris", lab: lab_1)
scientist_2 = Scientist.create(name: "George", specialty: "Theory", university: "University of Paris", lab: lab_1)
experiment_1 = Experiment.create(name: "MINERvA", objective: "study neutrino reactions with five different nuclei", num_months: 4)
experiment_2 = Experiment.create(name: "Radioactive-TV", objective: "is the TV radioactive?", num_months: 8)
experiment_3 = Experiment.create(name: "Tree-Therapy", objective: "does the apple fall far from the tree?", num_months: 7)
experiment_4 = Experiment.create(name: "Apple-Theory", objective: "does the apple understand the tree?", num_months: 9)
sci_exp_1 = ScientistExperiment.create(experiment: experiment_1, scientist: scientist_1)
sci_exp_2 = ScientistExperiment.create(experiment: experiment_2, scientist: scientist_1)
sci_exp_3 = ScientistExperiment.create(experiment: experiment_3, scientist: scientist_1)
sci_exp_4 = ScientistExperiment.create(experiment: experiment_3, scientist: scientist_2)
sci_exp_5 = ScientistExperiment.create(experiment: experiment_2, scientist: scientist_2)