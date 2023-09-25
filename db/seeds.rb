# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

lab1 = Lab.create!(name: "Baylor's Science Lab")

scientist1 = Scientist.create!(name: "Bill", specialty: "Anatomy", university: "Baylor", lab: lab1)
scientist2 = Scientist.create!(name: "Jill", specialty: "Biology", university: "Baylor", lab: lab1)
scientist3 = Scientist.create!(name: "Gil", specialty: "Chemistry", university: "Baylor", lab: lab1)

experiment1 = Experiment.create!(name: "Muscle Test", objective: "To test muscles", num_months: 1)
experiment2 = Experiment.create!(name: "Cell Test", objective: "To test cells", num_months: 2)
experiment3 = Experiment.create!(name: "PH Test", objective: "To test PH levels", num_months: 3)

experiment_scientist1 = ExperimentScientist.create!(experiment: experiment1, scientist: scientist1)
experiment_scientist2 = ExperimentScientist.create!(experiment: experiment2, scientist: scientist1)