require "rails_helper"

RSpec.feature "the experiments index page" do
  describe 'when I visit /experiments' do
    it 'US3 displays the name of long running experiments in descending order' do
      experiment1 = Experiment.create!(name: "Manhattan Project", objective: "Develop the first nuclear weapons", num_months: 36)
      experiment2 = Experiment.create!(name: "Trinity", objective: "Test the first nuclear weapons", num_months: 5)
      experiment3 = Experiment.create!(name: "MINERvA", objective: "Neutrino scattering", num_months: 12)
      experiment4 = Experiment.create!(name: "Neutronimator", objective: "Do cool things with Neutrons", num_months: 20)

      visit "/experiments"

      expect(page).to have_content(experiment1.name)
      expect(page).to_not have_content(experiment2.name)
      expect(page).to have_content(experiment3.name)
      expect(page).to have_content(experiment4.name)

      expect(experiment1.name).to appear_before(experiment4.name)
      expect(experiment4.name).to appear_before(experiment3.name)
    end
  end
end