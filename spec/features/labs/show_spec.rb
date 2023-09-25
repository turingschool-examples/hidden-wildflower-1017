require "rails_helper"

RSpec.feature "the lab show page" do
  describe 'when I visit /labs/:lab_id' do
    it 'EXT4 displays the name of the scientists with the number of experiments in desc order' do
      lab1 = Lab.create!(name: "Los Alamos National Laboratory")
      scientist1 = lab1.scientists.create!(name: "Robert Oppenheimer", specialty: "Physics", university: "University of Chicago")
      scientist2 = lab1.scientists.create!(name: "Enrico Fermi", specialty: "Physics", university: "University of Paris")
      experiment1 = Experiment.create!(name: "Manhattan Project", objective: "Develop the first nuclear weapons", num_months: 36)
      experiment2 = Experiment.create!(name: "Trinity", objective: "Test the first nuclear weapons", num_months: 1)
      experiment3 = Experiment.create!(name: "MINERvA", objective: "Neutrino scattering", num_months: 12)
      experiment4 = Experiment.create!(name: "Neutronimator", objective: "Do cool things with Neutrons", num_months: 20)

      scientist1.experiments << experiment1
      scientist1.experiments << experiment2
      scientist2.experiments << experiment1
      scientist2.experiments << experiment3
      scientist2.experiments << experiment4

      visit "/labs/#{lab1.id}"

      within("#scientist-#{scientist1.id}") do
        expect(page).to have_content(scientist1.name)
        expect(page).to have_content("#{scientist1.experiments.count} experiments")
      end
      
      within("#scientist-#{scientist2.id}") do
        expect(page).to have_content(scientist2.name)
        expect(page).to have_content("#{scientist2.experiments.count} experiments")
      end

      expect(scientist2.name).to appear_before(scientist1.name)
    end
  end
end

