require "rails_helper"

RSpec.describe "experiments index page" do

    it 'US3 displays the name of long running experiments in descending order' do
      experiment_1 = Experiment.create!(name: "Proton Vis", objective: "Plot proton decay paths", num_months: 9)
      experiment_2 = Experiment.create!(name: "Muon Count", objective: "Measure Muon creation rate", num_months: 2)
      experiment_3 = Experiment.create!(name: "Positron STABL", objective: "Detect positron spin changes", num_months: 22)
      experiment_4 = Experiment.create!(name: "Charm", objective: "Force color of charm quarks", num_months: 15)

      visit "/experiments"

      expect(page).to have_content(experiment_1.name)
      expect(page).to_not have_content(experiment_2.name)
      expect(page).to have_content(experiment_3.name)
      expect(page).to have_content(experiment_4.name)

      expect(experiment_3.name).to appear_before(experiment_4.name)
      expect(experiment_4.name).to appear_before(experiment_1.name)
    end
end 