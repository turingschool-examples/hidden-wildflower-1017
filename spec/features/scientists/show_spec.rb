require "rails_helper"

RSpec.feature "the scientists show page" do
  describe 'when I visit /scientists/:scientist_id' do
    it 'US1 displays name, specialtty, university, lab, and experiments of that scientist' do
      lab1 = Lab.create!(name: "Los Alamos National Laboratory")
      scientist1 = lab1.scientists.create!(name: "Robert Oppenheimer", specialty: "Physics", university: "University of Chicago")
      experiment1 = Experiment.create!(name: "Manhattan Project", objective: "Develop the first nuclear weapons", num_months: 36)
      experiment2 = Experiment.create!(name: "Trinity", objective: "Test the first nuclear weapons", num_months: 1)

      scientist1.experiments << experiment1
      scientist1.experiments << experiment2

      visit "/scientists/#{scientist1.id}"

      expect(page).to have_content(scientist1.name)
      expect(page).to have_content(scientist1.specialty)
      expect(page).to have_content(scientist1.university)
      expect(page).to have_content(scientist1.lab.name)
      expect(page).to have_content(experiment1.name)
      expect(page).to have_content(experiment2.name)
    end

    it 'US2 displays a button to remove the experiment from the scientist' do
      lab1 = Lab.create!(name: "Los Alamos National Laboratory")
      scientist1 = lab1.scientists.create!(name: "Robert Oppenheimer", specialty: "Physics", university: "University of Chicago")
      scientist2 = lab1.scientists.create!(name: "Enrico Fermi", specialty: "Physics", university: "University of Chicago")
      experiment1 = Experiment.create!(name: "Manhattan Project", objective: "Develop the first nuclear weapons", num_months: 36)
      experiment2 = Experiment.create!(name: "Trinity", objective: "Test the first nuclear weapons", num_months: 1)
      scientist1.experiments << experiment1
      scientist1.experiments << experiment2
      scientist2.experiments << experiment1

      visit "/scientists/#{scientist1.id}"

      expect(page).to have_button("Remove")
      expect(page).to have_button("Remove")

      within("#experiment-#{experiment1.id}") do
        click_button("Remove")
      end

      expect(current_path).to eq("/scientists/#{scientist1.id}")
      expect(page).to_not have_content(experiment1.name)

      visit "/scientists/#{scientist2.id}"

      expect(page).to have_content(experiment1.name)  
    end
  end
end