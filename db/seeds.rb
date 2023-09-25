# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

lab1 = Lab.create!(name: 'Lab A')
lab2 = Lab.create!(name: 'Lab B')

scientist1 = Scientist.create!(
  name: 'Tiny Tim',
  specialty: 'Biologist',
  university: 'University of Science',
  lab: lab1
)

scientist2 = Scientist.create!(
  name: 'Roger Rabbit',
  specialty: 'Chemist',
  university: 'Chemistry University',
  lab: lab2
)

experiment1 = Experiment.create!(
  name: 'Destroyer',
  objective: 'Study DNA replication',
  num_months: 6
)

experiment2 = Experiment.create!(
  name: 'End Game',
  objective: 'Chemical analysis',
  num_months: 9
)

ScientistExperiment.create!(scientist: scientist1, experiment: experiment1)
ScientistExperiment.create!(scientist: scientist1, experiment: experiment2)
ScientistExperiment.create!(scientist: scientist2, experiment: experiment2)
