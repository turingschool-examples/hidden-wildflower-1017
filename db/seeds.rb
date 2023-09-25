# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@lab_1 = Lab.create(name: "Fermilab")

@scientist_1 = @lab_1.scientists.create(
  name: "Marie Curie",
  specialty: "radioactivity",
  university: "University of Paris"
)

@scientist_2 = @lab_1.scientists.create(
  name: "Sammy Scientist",
  specialty: "physics",
  university: "University of Colorado"
)

@experiment_1 = Experiment.create(
  name: "MINERvA",
  objective: "study neutrino reactions with five different nuclei",
  num_months: 9
)

@experiment_2 = Experiment.create(
  name: "Cell Structure under Intense Heat",
  objective: "study the changes in cell structure in extreme heat",
  num_months: 5
)

@experiment_3 = Experiment.create(
  name: "How silly is too silly",
  objective: "understanding the impact of being silly",
  num_months: 15
)

ScientistExperiment.create(scientist: @scientist_1, experiment: @experiment_1)
ScientistExperiment.create(scientist: @scientist_1, experiment: @experiment_2)
ScientistExperiment.create(scientist: @scientist_2, experiment: @experiment_1)