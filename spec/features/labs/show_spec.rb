require "rails_helper"

RSpec.feature "the lab show page" do
  describe 'when I visit /labs/:lab_id' do
    it 'EXT4 displays the name of the scientists with the number of experiments in desc order' do
      lab1 = Lab.create!(name: "Los Alamos National Laboratory")
      scientist1 = lab1.scientists.create!(name: "Robert Oppenheimer", specialty: "Physics", university: "University of Chicago")
      scientist2 = lab1.scientists.create!(name: "Enrico Fermi", specialty: "Physics", university: "University of Paris")
      experiment1 = Experiment.create!(name: "Manhattan Project", objective: "Develop the first nuclear weapons", num_months: 36)
      experiment2 = Experiment.create!(name: "Trinity", objective: "Test the first nuclear weapons", num_months: 1)

      scientist1.experiments << experiment1
      scientist1.experiments << experiment2
      scientist2.experiments << experiment1

      visit "/labs/#{lab1.id}"

      within("#scientist-#{scientist1.id}") do
        expect(page).to have_content(scientist1.name)
        expect(page).to have_content("2 experiments")
      end
      
      within("#scientist-#{scientist2.id}") do
        expect(page).to have_content(scientist2.name)
        expect(page).to have_content("1 experiments")
      end

      expect(scientist1.name).to appear_before(scientist2.name)
    end
  end
end

