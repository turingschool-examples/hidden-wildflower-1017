# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@fermilab = Lab.create!(name: "Fermilab")
@curie = @fermilab.scientists.create!(name: "Marie Curie", specialty: "radioactivity", university: "University of Paris")
@feynman = @fermilab.scientists.create!(name: "Richard Feynman", specialty: "theoretical physics", university: "Princeton University")

@jpl = Lab.create!(name: "NASA Jet Propulsion Lab")
@sagan = @jpl.scientists.create!(name: "Carl Sagan", specialty: "astronomy", university: "University of Chicago")

@minerva = Experiment.create!(name: "MINERvA", objective: "study neutrino reactions with five different nuclei", num_months: 4)
@minerva_curie = @minerva.scientist_experiments.create!(scientist_id: @curie.id, experiment_id: @minerva.id)

@manhattan = Experiment.create!(name: "Manhattan Project", objective: "use little thing to make big explosion", num_months: 36)
@manhattan_curie = @manhattan.scientist_experiments.create!(scientist_id: @curie.id, experiment_id: @manhattan.id)
@manhattan_feynman = @manhattan.scientist_experiments.create!(scientist_id: @feynman.id, experiment_id: @manhattan.id)

@voyager = Experiment.create!(name: "Voyager Program", objective: "leave the solar system", num_months: 999999999)
@voyager_sagan = @voyager.scientist_experiments.create!(scientist_id: @sagan.id, experiment_id: @voyager.id)
