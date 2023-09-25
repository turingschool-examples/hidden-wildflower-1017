# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@lab = Lab.create!(name: "Fermilab")
    @scientist = @lab.scientists.create!(name: "Marie Curie", specialty: "radioactivity", university: "University of Paris")
    @scientist_2 = @lab.scientists.create!(name: "Elizabeth Curie", specialty: "radioactivity", university: "University of Paris")
    @experiment = Experiment.create!(name: "MINERvA", description: "study neutrino reactions with five different nuclei", num_months: 4)
    ScientistExperiment.create!(scientist_id: @scientist.id, experiment_id: @experiment.id)
    ScientistExperiment.create!(scientist_id: @scientist_2.id, experiment_id: @experiment.id)