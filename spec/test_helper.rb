def load_test_data
  @lab_1 = Lab.create!(name: "Fermilab")
    @scientist_1 = @lab_1.scientists.create!(name: "Marie Curie", specialty: "radioactivity", university: "University of Paris")
    @scientist_2 = @lab_1.scientists.create!(name: "Albert Einstein", specialty: "Nuclear Fusion", university: "University of Zurich")

  @lab_2 = Lab.create!(name: "Dextors Laboritory")
      @scientist_3 = @lab_2.scientists.create!(name: "Sean Hurbert", specialty: "Gene Splicing", university: "University of Texas")

    @experiment_1 = @scientist_1.experiments.create!(name: "MINERvA", objective: "study neutrino reactions with five different nuclei", num_months: 4)
    @experiment_2 = @scientist_1.experiments.create!(name: "The Perfect Coffee", objective: "To create the perfect cup of coffee", num_months: 16)
    @experiment_3 = @scientist_2.experiments.create!(name: "Science", objective: "Test Data", num_months: 20)

    ScientistExperiment.create(scientist: @scientist_2, experiment: @experiment_1)
end