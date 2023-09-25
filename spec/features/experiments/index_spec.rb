require "rails_helper"

RSpec.describe "scientists show page" do
  before(:each) do
    @lab_1 = Lab.create!(name: "CDC 4")

    @scientist_1 = Scientist.create!(name: "John Brown", specialty: "Biology", university: "Brown Univeristy", lab_id: @lab_1.id)
    @scientist_2 = Scientist.create!(name: "Alex Mack", specialty: "Chemistry", university: "Penn Univeristy", lab_id: @lab_1.id)

    @experiment_1 = Experiment.create!(name: "Divergence", objective: "Study Time", num_months: 18)
    @experiment_2 = Experiment.create!(name: "Universe", objective: "How big is it?", num_months: 36)
    @experiment_3 = Experiment.create!(name: "Evolution", objective: "Find Ancestors", num_months: 9)
    @experiment_4 = Experiment.create!(name: "X-Ray", objective: "See peoples bones", num_months: 4)

    @john_experiment_1 = @scientist_1.scientist_experiments.create!(scientist_id: @scientist_1.id, experiment_id: @experiment_1.id)
    @john_experiment_2 = @scientist_1.scientist_experiments.create!(scientist_id: @scientist_1.id, experiment_id: @experiment_2.id)
    @alex_experiment_1 = @scientist_2.scientist_experiments.create!(scientist_id: @scientist_2.id, experiment_id: @experiment_3.id)
    @alex_experiment_2 = @scientist_2.scientist_experiments.create!(scientist_id: @scientist_2.id, experiment_id: @experiment_1.id)

  end
  
  describe "As a visitor, When I visit the experiment index page" do
    it "I see the names of all long running experiments (longer than 6 months)" do
      visit "/experiments"

      expect(page).to have_content(@experiment_1.name)
      expect(page).to have_content(@experiment_2.name)
      expect(page).to have_content(@experiment_3.name)
      expect(page).to_not have_content(@experiment_4.name)
      save_and_open_page
    end
  end
end