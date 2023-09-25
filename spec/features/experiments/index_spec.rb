require 'rails_helper'

RSpec.describe "Expeiment Index Page" do 
  before :each do 
    @lab_1 = Lab.create!(name: "Fermilab") 

    @sci_1 = @lab_1.scientists.create!(name: "Marie Curie", specialty: "radioactivity", university: "University of Paris")
    @sci_2 = @lab_1.scientists.create!(name: "Katherine Johnson", specialty: "Mathematics/Space", university: "West Virginia State University")

    @exp_1 = Experiment.create!(name: "MINERvA", objective: "study neutrino reactions with 5 different nuclei", num_months: 4)
    @exp_2 = Experiment.create!(name: "Freedom 7", objective: "trajectory analysis", num_months: 10)

    @exp_3 = Experiment.create!(name: "EXP 3", objective: "a very scientific description", num_months: 12)
    @exp_4 = Experiment.create!(name: "EXP 4", objective: "SCIENCE", num_months: 9)

    @sci_exp_1 = ScientistExperiment.create!(scientist_id: @sci_1.id, experiment_id: @exp_1.id)
    @sci_exp_2 = ScientistExperiment.create!(scientist_id: @sci_2.id, experiment_id: @exp_1.id)

    @sci_exp_3 = ScientistExperiment.create!(scientist_id: @sci_2.id, experiment_id: @exp_2.id)
    @sci_exp_3 = ScientistExperiment.create!(scientist_id: @sci_1.id, experiment_id: @exp_2.id)
  end

  it "shows a list of long-running experiments - that have been running for longer than 6 months in descending order" do 
    visit experiments_path
    expect("EXP 3").to appear_before("Freedom 7")
    expect("Freedom 7").to appear_before("EXP 4")    
  end
end