require "rails_helper"

RSpec.describe "scientists show page" do
  before :each do
    @lab_1 = Lab.create!(name: "Los Alamos")
    @lab_2 = Lab.create!(name: "Oakridge")
    @experiment_1 = Experiment.create!(name: "Proton Vis", objective: "Plot proton decay paths", num_months: 9)
    @experiment_2 = Experiment.create!(name: "Muon Count", objective: "Measure Muon creation rate", num_months: 12)
    @experiment_3 = Experiment.create!(name: "Positron STABL", objective: "Detect positron spin changes", num_months: 22)
    @experiment_4 = Experiment.create!(name: "Charm", objective: "Force color of charm quarks", num_months: 15)

    @scientist_1 = Scientist.create!(name: "Susan May", specialty: "HEP", university: "UCLA", lab: @lab_1)
    @scientist_2 = Scientist.create!(name: "Bill Knight", specialty: "STAT", university: "Oxford", lab: @lab_1)
    @scientist_3 = Scientist.create!(name: "Marah Willson", specialty: "PROB", university: "MIT", lab: @lab_2)

    @scientist_experiment_1 = ScientistExperiment.create!(scientist: @scientist_1, experiment: @experiment_1)
    @scientist_experiment_2 = ScientistExperiment.create!(scientist: @scientist_1, experiment: @experiment_2)
    @scientist_experiment_3 = ScientistExperiment.create!(scientist: @scientist_2, experiment: @experiment_1)
    @scientist_experiment_4 = ScientistExperiment.create!(scientist: @scientist_2, experiment: @experiment_3)
    @scientist_experiment_5 = ScientistExperiment.create!(scientist: @scientist_3, experiment: @experiment_3)

  end

  # ---------  User Story 1, Scientist Show Page
  # When I visit a scientist's show page
  # I see all of that scientist's information including:
  #  - name
  #  - specialty
  #  - university where they got their degree
  # And I see the name of the lab where this scientist works
  # And I see the names of all of the experiments this scientist is running
  describe "When I visit a scientist's show page" do
    it "shows their name, specialty, university, lab, and all experiments they are working on" do
      visit "/scientists/#{@scientist_1.id}"
      expect(page).to have_content(@scientist_1.name)
      expect(page).to have_content(@scientist_1.specialty)
      expect(page).to have_content(@scientist_1.university)
      expect(page).to have_content(@lab_1.name)
      expect(page).to have_content(@experiment_1.name)
      expect(page).to have_content(@experiment_2.name)
      expect(page).to_not have_content(@scientist_2.name)
      expect(page).to_not have_content(@experiment_3.name)
      expect(page).to_not have_content(@lab_2.name)
    end

    #  --------   User Story 2, Remove an Experiment from a Scientist
    # When I visit a scientist's show page
    # Then next to each experiment's name, I see a button to remove that experiment from that scientist's work load
    # When I click that button for one experiment
    # I'm brought back to the scientist's show page
    # And I no longer see that experiment's name listed
    # And when I visit a different scientist's show page that is working on that same experiment,
    # Then I see that the experiment is still on the other scientist's work load
    it "next to each experiment's name, I see a button to remove that experiment" do
      visit "/scientists/#{@scientist_1.id}"
      expect(page).to have_content(@scientist_1.name)
      expect(page).to have_content(@experiment_2.name)
      expect(page).to have_content(@experiment_1.name)
      
      within("#exp-#{@experiment_2.id}") do
        expect(page).to have_button("Remove")
      end
      
      within("#exp-#{@experiment_1.id}") do
        expect(page).to have_button("Remove")
        click_button("Remove")
      end
      
      expect(current_path).to eq("/scientists/#{@scientist_1.id}")
      expect(page).to_not have_content(@experiment_1.name)

      visit "/scientists/#{@scientist_2.id}"
      expect(page).to have_content(@experiment_1.name)
    end
  end
end