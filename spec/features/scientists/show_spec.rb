require 'rails_helper'

RSpec.describe "Scientists show page" do 
  before :each do
    @lab_1 = Lab.create!(name: "Frankenstein's Lab")
    @lab_2 = Lab.create!(name: "Dr. Jekyll's Lab")
    @lab_3 = Lab.create!(name: "Einstein's Lab")

    @scientist_1 = @lab_1.scientists.create!(name: "Dr.Frankenstein", specialty: "Body Parts", university: "Ingolstadt University")
    @scientist_2 = @lab_1.scientists.create!(name: "Igor", specialty: "Brain", university: "Miskatonic University")
    @scientist_3 = @lab_2.scientists.create!(name: "Dr.Jekyll", specialty: "Chemistry", university: "University of Edinburgh")
    @scientist_4 = @lab_2.scientists.create!(name: "Mr.Hyde", specialty: "Chemistry", university: "University of Edinburgh")
    @scientist_5 = @lab_3.scientists.create!(name: "Albert Einstein", specialty: "Physics", university: "Zurich")


    @experiment_1 = Experiment.create!(name: "Reanimation", objective: "Bring back the dead", num_months: 2)
    @experiment_2 = Experiment.create!(name: "Brain Transplant", objective: "Get a new brain in there", num_months: 6)
    @experiment_3 = Experiment.create!(name: "Personality Split", objective: "Split some personalities", num_months: 8)
    @experiment_4 = Experiment.create!(name: "General Relativity", objective: "Bring back the dead", num_months: 12)
    @experiment_5 = Experiment.create!(name: "Quantum Mechanics", objective: "Really difficult physics", num_months: 24)
    @experiment_6 = Experiment.create!(name: "String Theory", objective: "Really really difficult physics", num_months: 36)

    @scientist_experiment_1 = ScientistExperiment.create!(scientist_id: @scientist_1.id, experiment_id: @experiment_1.id)
    @scientist_experiment_2 = ScientistExperiment.create!(scientist_id: @scientist_1.id, experiment_id: @experiment_2.id)
    @scientist_experiment_3 = ScientistExperiment.create!(scientist_id: @scientist_2.id, experiment_id: @experiment_2.id)
    @scientist_experiment_4 = ScientistExperiment.create!(scientist_id: @scientist_3.id, experiment_id: @experiment_3.id)
    @scientist_experiment_5 = ScientistExperiment.create!(scientist_id: @scientist_4.id, experiment_id: @experiment_3.id)
    @scientist_experiment_6 = ScientistExperiment.create!(scientist_id: @scientist_5.id, experiment_id: @experiment_4.id)
    @scientist_experiment_7 = ScientistExperiment.create!(scientist_id: @scientist_5.id, experiment_id: @experiment_5.id)
    @scientist_experiment_8 = ScientistExperiment.create!(scientist_id: @scientist_5.id, experiment_id: @experiment_6.id)
  end
  describe "When I visit /scientists/:id" do
    it "displays the scientists name, speciality, university attended, the scientists lab" do 
      visit scientist_path(@scientist_1)

      expect(page).to have_content(@scientist_1.name)
      expect(page).to have_content(@scientist_1.specialty)
      expect(page).to have_content(@scientist_1.university)
      expect(page).to have_content(@scientist_1.lab.name)
    end

    it "displays the names of all the experiments that the sientist is working on" do 
      visit scientist_path(@scientist_1)

      within("#experiment-#{@experiment_1.id}") do
        expect(page).to have_content(@experiment_1.name)
      end

      within("#experiment-#{@experiment_2.id}") do
        expect(page).to have_content(@experiment_2.name)
      end
    end

    it "has a button to delete that experiments from a specific scientist" do 
      visit scientist_path(@scientist_1)

      within("#experiment-#{@experiment_1.id}") do
        expect(page).to have_button("Delete Experiment")
        click_button "Delete Experiment"
        expect(current_path).to eq(scientist_path(@scientist_1))
      end

      within("#experiment-#{@experiment_2.id}") do
        expect(page).to have_button("Delete Experiment")
      end

      expect(page).to_not have_content(@experiment_1.name)
      expect(page).to have_content(@experiment_2.name)
    end

    it "does not delete the experiment from another scientists show page who is also working on that experiment" do 
      visit scientist_path(@scientist_1)

      within("#experiment-#{@experiment_2.id}") do
        expect(page).to have_button("Delete Experiment")
        click_button "Delete Experiment"
        expect(current_path).to eq(scientist_path(@scientist_1))
      end

      visit scientist_path(@scientist_2)

      within("#experiment-#{@experiment_2.id}") do
        expect(page).to have_content(@experiment_2.name)
      end
    end
  end
end