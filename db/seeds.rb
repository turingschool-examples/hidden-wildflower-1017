# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

lab1 = Lab.create!(name: "Los Alamos National Laboratory")
scientist1 = lab1.scientists.create!(name: "Robert Oppenheimer", specialty: "Physics", university: "University of Chicago")
scientist2 = lab1.scientists.create!(name: "Enrico Fermi", specialty: "Physics", university: "University of Paris")
experiment1 = Experiment.create!(name: "Manhattan Project", objective: "Develop the first nuclear weapons", num_months: 36)
experiment2 = Experiment.create!(name: "Trinity", objective: "Test the first nuclear weapons", num_months: 5)
experiment3 = Experiment.create!(name: "MINERvA", objective: "Neutrino scattering", num_months: 12)
experiment4 = Experiment.create!(name: "Neutronimator", objective: "Do cool things with Neutrons", num_months: 20)
scientist1.experiments << experiment1
scientist1.experiments << experiment2
scientist2.experiments << experiment1