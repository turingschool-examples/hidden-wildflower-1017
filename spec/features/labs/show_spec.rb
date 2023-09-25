require "rails_helper"

RSpec.describe "Lab Show Page", type: :feature do
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

    @experiment_3 = Experiment.create(
      name: "How silly is too silly",
      objective: "understanding the impact of being silly",
      num_months: 15
    )

    ScientistExperiment.create(scientist: @scientist_1, experiment: @experiment_1)
    ScientistExperiment.create(scientist: @scientist_1, experiment: @experiment_2)
    ScientistExperiment.create(scientist: @scientist_2, experiment: @experiment_1)
    ScientistExperiment.create(scientist: @scientist_2, experiment: @experiment_2)
    ScientistExperiment.create(scientist: @scientist_2, experiment: @experiment_3)

    visit lab_path(@lab_1)
  end
  
  describe "as a visitor" do
    describe "when I visit a lab's show page" do
      it "I see the lab's name, the names of all scientists that work at this lab, next ot each scientist I see the number of experiments associasted with the scientist, and I see the list of scientists is ordered from most number of experiments to least number of experiments" do
        expect(page).to have_content(@lab_1.name)

        expect(page).to have_content("Scientists")
        within("#scientists") do
          expect(page).to have_content("#{@scientist_2.name}: 3 experiments")
          expect(page).to have_content("#{@scientist_1.name}: 2 experiments")

          expect("#{@scientist_2.name}: 3 experiments").to appear_before("#{@scientist_1.name}: 2 experiments")
        end
      end
    end
  end
end