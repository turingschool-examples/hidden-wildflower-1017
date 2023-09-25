require "rails_helper"

RSpec.describe "Scientist Show Page", type: :feature do
  before(:each) do
    @lab_1 = Lab.create(name: "Fermilab")

    @scientist_1 = @lab_1.scientists.create(
      name: "Marie Curie",
      specialty: "radioactivity",
      university: "University of Paris"
    )

    @scientist_2 = @lab_1.scientists.create(
      name: "Sammy Scientist",
      specialty: "physics",
      university: "University of Colorado"
    )

    @experiment_1 = Experiment.create(
      name: "MINERvA",
      objective: "study neutrino reactions with five different nuclei",
      num_months: 4
    )

    @experiment_2 = Experiment.create(
      name: "Cell Structure under Intense Heat",
      objective: "study the changes in cell structure in extreme heat",
      num_months: 2
    )

    ScientistExperiment.create(scientist: @scientist_1, experiment: @experiment_1)
    ScientistExperiment.create(scientist: @scientist_1, experiment: @experiment_2)
    ScientistExperiment.create(scientist: @scientist_2, experiment: @experiment_1)

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

      describe "next to each experiment's name I see a button to remove that experiment from the scientist's work load" do
        describe "when I click that button for one experiment, I'm brought back to the scientist's show page and I no longer see that experiment's name listed" do
          it "and when I visit a different scientist's show page that is working on the same experiment I see that the experiment is still on the other scientist's work load" do
            within("#experiments") do
              expect(page).to have_button("Delete #{@experiment_1.name}")

              click_button "Delete #{@experiment_1.name}"
            end

            expect(current_path).to eq(scientist_path(@scientist_1))

            within("#experiments") do
              expect(page).to have_content("#{@experiment_2.name}")
              expect(page).to have_button("Delete #{@experiment_2.name}")
              expect(page).not_to have_content("#{@experiment_1.name}")
              expect(page).not_to have_button("Delete #{@experiment_1.name}")
            end

            visit scientist_path(@scientist_2)

            within("#experiments") do
              expect(page).to have_content("#{@experiment_1.name}")
              expect(page).to have_button("Delete #{@experiment_1.name}")
            end
          end
        end
      end
    end
  end
end