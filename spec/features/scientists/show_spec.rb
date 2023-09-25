require "rails_helper"

RSpec.describe "Scientist Show Page", type: :feature do
  before(:each) do
    @lab_1 = Lab.create(name: "Fermilab")

    @scientist_1 = @lab_1.scientists.create(
      name: "Marie Curie",
      specialty: "radioactivity",
      university: "University of Paris"
    )

    @experiment_1 = @scientist_1.experiments.create(
      name: "MINERvA",
      objective: "study neutrino reactions with five different nuclei",
      num_months: 4
    )

    @experiment_2 = @scientist_1.experiments.create(
      name: "Cell Structure under Intense Heat",
      objective: "study the changes in cell structure in extreme heat",
      num_months: 2
    )

    visit scientist_path(@scientist_1)
  end
  describe "as a visitor" do
    describe "when I visit a scientist's show page" do
      it "I see all of that scientist's information including the name, speciality, university where they got their degree, the name of the lab where they work, and the names of all of the experiments they are running" do
        expect(page).to have_content(@scientist_1.name)
        expect(page).to have_content("Specialty: #{@scientist_1.specialty}")
        expect(page).to have_content("University: #{@scientist_1.university}")
        expect(page).to have_content("Lab: #{@lab_1.name}")

        expect(page).to have_content("Experiments")
        within("#experiments") do
          expect(page).to have_content("#{@experiment_1.name}")
          expect(page).to have_content("#{@experiment_2.name}")
        end
      end
    end
  end
end