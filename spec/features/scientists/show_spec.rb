require "rails_helper"

RSpec.describe "Scientist Show Page" do
  before :each do
    @lab1 = Lab.create!(name: "Baylor's Science Lab")

    @scientist1 = Scientist.create!(name: "Bill", specialty: "Anatomy", university: "Baylor", lab: @lab1)
    @scientist2 = Scientist.create!(name: "Jill", specialty: "Biology", university: "Baylor", lab: @lab1)
    @scientist3 = Scientist.create!(name: "Gil", specialty: "Chemistry", university: "Baylor", lab: @lab1)

    @experiment1 = Experiment.create!(name: "Muscle Test", objective: "To test muscles", num_months: 1)
    @experiment2 = Experiment.create!(name: "Cell Test", objective: "To test cells", num_months: 2)
    @experiment3 = Experiment.create!(name: "PH Test", objective: "To test PH levels", num_months: 3)

    @experiment_scientist1 = ExperimentScientist.create!(experiment: @experiment1, scientist: @scientist1)
    @experiment_scientist2 = ExperimentScientist.create!(experiment: @experiment2, scientist: @scientist1)

    visit "/scientists/#{@scientist1.id}"
  end

  describe "When I visit a scientist's show page" do
    it "I see all of that scientist's information" do
      expect(page).to have_content("Name: #{@scientist1.name}")
      expect(page).to have_content("Specialty: #{@scientist1.specialty}")
      expect(page).to have_content("Graduated from: #{@scientist1.university}")
      expect(page).to have_content("Current Laboratory: #{@lab1.name}")
      within("div.current-experis") do
        expect(page).to have_content("#{@experiment1.name}")
        expect(page).to have_content("#{@experiment2.name}")
      end
    end

    it "next to each experiment's name, I see a button to remove that experiment" do
      within("##{@experiment1.id}") do
        expect(page).to have_button("Remove")
      end

      within("##{@experiment2.id}") do
        expect(page).to have_button("Remove")
      end
    end

    it "When I click that button for one experiment I'm brought back to the scientist's show page And I no longer see that experiment's name listed" do
      within("##{@experiment1.id}") do
        expect(page).to have_button("Remove")
        click_button "Remove"
      end

      expect(current_path).to eq("/scientists/#{@scientist1.id}")
      expect(page).to_not have_content("#{@experiment1.name}")
    end
  end
end