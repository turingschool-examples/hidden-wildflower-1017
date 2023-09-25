require 'rails_helper'

RSpec.describe Scientist do
  before :each do 
    @lab = Lab.create!(name: "Fermilab")
    @scientist = @lab.scientists.create!(name: "Marie Curie", specialty: "radioactivity", university: "University of Paris")
    @scientist_2 = @lab.scientists.create!(name: "Elizabeth Curie", specialty: "radioactivity", university: "University of Paris")
    @experiment = Experiment.create!(name: "MINERvA", description: "study neutrino reactions with five different nuclei", num_months: 4)
    ScientistExperiment.create!(scientist_id: @scientist.id, experiment_id: @experiment.id)
  end

  describe "relationships" do
    it { should belong_to(:lab) }
    it { should have_many(:scientist_experiments) }
    it { should have_many(:experiments).through(:scientist_experiments) }
  end

  describe "#lab_name" do
    it "gives the name of the lab for that scientist" do 
      expect(@scientist.lab_name).to eq("Fermilab")
    end
  end
end