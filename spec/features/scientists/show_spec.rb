require 'rails_helper'

RSpec.describe "Scientist Show Page", type: :feature do
  before(:each) do
    @lab = Lab.create!(name: "Fermilab")
    @scientist = @lab.scientists.create!(name: "Marie Curie", specialty: "radioactivity", university: "University of Paris")
    @scientist_2 = @lab.scientists.create!(name: "Elizabeth Curie", specialty: "radioactivity", university: "University of Paris")
    @experiment = Experiment.create!(name: "MINERvA", description: "study neutrino reactions with five different nuclei", num_months: 4)
    ScientistExperiment.create!(scientist_id: @scientist.id, experiment_id: @experiment.id)
  end

  it "I see all of that scientist's information including: name, speciality, and the university where they got their degree" do 
    visit "/scientists/#{@scientist.id}"
  end
end