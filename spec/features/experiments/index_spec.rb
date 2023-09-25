require "rails_helper"

RSpec.describe "Experiment Index Page" do
  before :each do
    @lab1 = Lab.create!(name: "Baylor's Science Lab")

    @scientist1 = Scientist.create!(name: "Bill", specialty: "Anatomy", university: "Baylor", lab: @lab1)
    @scientist2 = Scientist.create!(name: "Jill", specialty: "Biology", university: "Baylor", lab: @lab1)
    @scientist3 = Scientist.create!(name: "Gil", specialty: "Chemistry", university: "Baylor", lab: @lab1)

    @experiment1 = Experiment.create!(name: "Muscle Test", objective: "To test muscles", num_months: 1)
    @experiment2 = Experiment.create!(name: "Cell Test", objective: "To test cells", num_months: 2)
    @experiment3 = Experiment.create!(name: "PH Test", objective: "To test PH levels", num_months: 3)
    @experiment4 = Experiment.create!(name: "Orbit Test", objective: "To test palentary orbit", num_months: 7)
    @experiment5 = Experiment.create!(name: "Molecular Structure Test", objective: "To test the structure of molecules", num_months: 8)
    @experiment6 = Experiment.create!(name: "Breath Test", objective: "How long can you hold your breath", num_months: 9)

    @experiment_scientist1 = ExperimentScientist.create!(experiment: @experiment1, scientist: @scientist1)
    @experiment_scientist2 = ExperimentScientist.create!(experiment: @experiment2, scientist: @scientist1)

    visit "/experiments"
  end

  describe "When I visit the experiments index page" do
    it "I see the names of all long running experiments (longer than 6 months)" do
      expect(page).to have_content("Long Standing Experiments (Longer than 6 months)")
      save_and_open_page
      expect(page).to have_content("#{@experiment4.name}")
      expect(page).to have_content("#{@experiment5.name}")
      expect(page).to have_content("#{@experiment6.name}")
    end

    it "Shows the names in descending order (longest to shortest)" do
      expect("#{@experiment6.name}").to appear_before("#{@experiment5.name}")
      expect("#{@experiment5.name}").to appear_before("#{@experiment4.name}")
    end
  end
end
