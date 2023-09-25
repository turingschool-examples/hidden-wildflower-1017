# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
@fermilab = Lab.create!(name: "Fermilab")
@marie = @fermilab.scientists.create!(name: "Marie Curie", specialty: "Radioactivity", university: "University of Paris")
@einstein = @fermilab.scientists.create!(name: "Albert Einstein", specialty: "Theoretical Physics", university: "University of Zurich")
@gene_splicing = Experiment.create!(name: "Gene Splicing", objective: "Splice the genes", num_months: 152)
@nuclear_fusion = Experiment.create!(name: "Nuclear Fusion", objective: "Fuse the nuclears", num_months: 303)
@anti_gravity = Experiment.create!(name: "Anti-Gravity", objective: "Defy gravity", num_months: 2)
ScientistExperiment.create!(scientist: @marie, experiment: @gene_splicing)
ScientistExperiment.create!(scientist: @marie, experiment: @nuclear_fusion)
ScientistExperiment.create!(scientist: @einstein, experiment: @gene_splicing)
ScientistExperiment.create!(scientist: @einstein, experiment: @nuclear_fusion)
ScientistExperiment.create!(scientist: @einstein, experiment: @anti_gravity)