require 'rails_helper'

RSpec.describe "Experiment Index Page", type: :feature do
  before(:each) do
    @lab = Lab.create!(name: "Fermilab")
    @scientist = @lab.scientists.create!(name: "Marie Curie", specialty: "radioactivity", university: "University of Paris")
    @scientist_2 = @lab.scientists.create!(name: "Elizabeth Curie", specialty: "radioactivity", university: "University of Paris")
    @experiment = Experiment.create!(name: "MINERvA", description: "study neutrino reactions with five different nuclei", num_months: 4)
    @experiment_2 = Experiment.create!(name: "Experiment 2", description: "study two", num_months: 4)
    @experiment_3 = Experiment.create!(name: "Experiment 3", description: "study three", num_months: 20)
    @experiment_4 = Experiment.create!(name: "Experiment 4", description: "study four", num_months: 10)
    @experiment_5 = Experiment.create!(name: "Experiment 5", description: "study five", num_months: 5)
    ScientistExperiment.create!(scientist_id: @scientist.id, experiment_id: @experiment.id)
    ScientistExperiment.create!(scientist_id: @scientist_2.id, experiment_id: @experiment.id)
  end

  it "I see the names of all long running experiments (longer than 6 months), And I see the names are in descending order" do 
    visit "/experiments"

    within('.long_experiments') do
      expect(page).to_not have_content(@experiment.name)
      expect(page).to_not have_content(@experiment_2.name)
      expect(page).to have_content(@experiment_3.name)
      expect(page).to have_content(@experiment_4.name)
      expect(page).to_not have_content(@experiment_5.name)
    end

    within('.long_experiments') do
      expect(@experiment_3.name).to appear_before(@experiment_4.name)
    end
  end
end