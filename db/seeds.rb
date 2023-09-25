# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@lab_1 = Lab.create!(name: "Frankenstein's Lab")
@lab_2 = Lab.create!(name: "Dr. Jekyll's Lab")
@lab_3 = Lab.create!(name: "Einstein's Lab")

@scientist_1 = @lab_1.scientists.create!(name: "Dr.Frankenstein", specialy: "Body Parts", university: "Ingolstadt University")
@scientist_2 = @lab_1.scientists.create!(name: "Igor", specialy: "Brain", university: "Miskatonic University")
@scientist_3 = @lab_2.scientists.create!(name: "Dr.Jekyll", specialy: "Chemistry", university: "University of Edinburgh")
@scientist_4 = @lab_2.scientists.create!(name: "Mr.Hyde", specialy: "Chemistry", university: "University of Edinburgh")
@scientist_5 = @lab_3.scientists.create!(name: "Albert Einstein", specialy: "Physics", university: "Zurich")


@experiment_1 = Experiment.create!(title: "Reanimation", objective: "Bring back the dead", num_months: 2)
@experiemnt_2 = Experiment.create!(title: "Brain Transplant", objective: "Get a new brain in there", num_months: 6)
@experiment_3 = Experiment.create!(title: "Personality Split", objective: "Split some personalities", num_months: 8)
@experiment_4 = Experiment.create!(title: "General Relativity", objective: "Bring back the dead", num_months: 12)
@experiment_5 = Experiment.create!(title: "Quantum Mechanics", objective: "Really difficult physics", num_months: 24)
@experiment_6 = Experiment.create!(title: "String Theory", objective: "Really really difficult physics", num_months: 36)

@scientist_experiment_1 = ScientistExperiment.create!(scientist: @scientist_1, experiment: @experiment_1)
@scientist_experiment_2 = ScientistExperiment.create!(scientist: @scientist_1, experiment: @experiment_2)
@scientist_experiment_3 = ScientistExperiment.create!(scientist: @scientist_2, experiment: @experiment_2)
@scientist_experiment_4 = ScientistExperiment.create!(scientist: @scientist_3, experiment: @experiment_3)
@scientist_experiment_5 = ScientistExperiment.create!(scientist: @scientist_4, experiment: @experiment_3)
@scientist_experiment_6 = ScientistExperiment.create!(scientist: @scientist_5, experiment: @experiment_4)
@scientist_experiment_7 = ScientistExperiment.create!(scientist: @scientist_5, experiment: @experiment_5)
@scientist_experiment_8 = ScientistExperiment.create!(scientist: @scientist_5, experiment: @experiment_6)
