# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@lab_1 = Lab.create!(name: "The Testing Locale")
@lab_2 = Lab.create!(name: "The Fake Lab")
@scientist_1 = Scientist.create!(name: "Chicken", specialty: "Being afraid", university: "Kiwi's Bird School", lab_id: @lab_1.id)
@scientist_2 = Scientist.create!(name: "Coco", specialty: "Low brain power", university: "Kiwi's Bird School", lab_id: @lab_1.id)
@scientist_3 = Scientist.create!(name: "Hiccup", specialty: "Poor flight control", university: "Kiwi's Bird School", lab_id: @lab_1.id)
@scientist_4 = Scientist.create!(name: "Kila", specialty: "Not even a bird", university: "None", lab_id: @lab_2.id)
@experiment_1 = Experiment.create!(name: "BrainP", objective: "Determine if we have brains at all", num_months: 17)
@experiment_2 = Experiment.create!(name: "FlAP", objective: "(Fl)y (A)ll over the (P)lace", num_months: 3)
@experiment_3 = Experiment.create!(name: "EATM", objective: "EAT ALL THE MILLET", num_months: 50)
ScientistExperiment.create!(scientist_id: @scientist_1.id, experiment_id: @experiment_2.id)
ScientistExperiment.create!(scientist_id: @scientist_1.id, experiment_id: @experiment_3.id)
ScientistExperiment.create!(scientist_id: @scientist_2.id, experiment_id: @experiment_1.id)
ScientistExperiment.create!(scientist_id: @scientist_2.id, experiment_id: @experiment_2.id)
ScientistExperiment.create!(scientist_id: @scientist_2.id, experiment_id: @experiment_3.id)
ScientistExperiment.create!(scientist_id: @scientist_3.id, experiment_id: @experiment_3.id)