require "rails_helper"

RSpec.describe "Scientists Show Page" do
  describe "As a visitor" do
    it "I see the scientist name, specialty, university including the scientist's lab and experiments" do
      lab_1 = Lab.create!(name: "Kling LLC")
      scientist_1 = lab_1.scientists.create!(name: "Waylon Runolfsdottir", specialty: "Physics", university: " Deckow Institute")
      experiment_1 = scientist_1.experiments.create!(name: "Argon")
      experiment_2 = scientist_1.experiments.create!(name: "Niobium")


      visit "/scientists/#{scientist_1.id}"

      within("#Scientist-#{scientist_1.id}") do

      expect(page).to have_content(scientist_1.name)
      expect(page).to have_content(scientist_1.specialty)
      expect(page).to have_content(scientist_1.university)
      end

      within("#Scientist_Lab-#{lab_1.id}") do
      expect(page).to have_content(lab_1.name)

      end

      within("#Scientist_Exp-#{scientist_1.id}") do
      expect(page).to have_content(experiment_1.name)
      expect(page).to have_content(experiment_2.name)
      end
    end
  end

  describe "As a visitor" do
    it "I see a link to delete an experiment and the page reloads with that experiment no longer on the page" do
      lab_1 = Lab.create!(name: "Kling LLC")
      scientist_1 = lab_1.scientists.create!(name: "Waylon Runolfsdottir", specialty: "Physics", university: " Deckow Institute")
      experiment_1 = scientist_1.experiments.create!(name: "Argon")
      experiment_2 = scientist_1.experiments.create!(name: "Niobium")

      visit "/scientists/#{scientist_1.id}"

      within("#Scientist_Exp-#{scientist_1.id}") do
        expect(page).to have_content(experiment_1.name)
        expect(page).to have_content(experiment_2.name)

        click_button "Remove #{experiment_1.name} experiment from work load"
      end

      expect(current_path).to eq("/scientists/#{scientist_1.id}")

      within("#Scientist_Exp-#{scientist_1.id}") do
        expect(page).to_not have_content(experiment_1.name)
        expect(page).to have_content(experiment_2.name)
      end
    end
  end
end