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

@experiment_1 = @scientist_1.experiments.create(
  name: "MINERvA",
  objective: "study neutrino reactions with five different nuclei",
  num_months: 4
)

@experiment_2 = @scientist_1.experiments.create(
  name: "Cell Structure under Intense Heat",
  objective: "study the changes in cell structure in extreme heat",
  num_months: 2
)