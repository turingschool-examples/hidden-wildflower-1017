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

    visit "/scientists/#{@scientist1.id}"
  end

  describe "When I visit a scientist's show page" do
    it "I see all of that scientist's information" do
      expect(page).to have_content("Name: #{@scientist1.name}")
      expect(page).to have_content("Specialty: #{@scientist1.specialty}")
      expect(page).to have_content("Graduated from: #{@scientist1.university}")
    end
  end
end