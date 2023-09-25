require "rails_helper"

RSpec.describe "scientists show page" do
  before(:each) do
    @lab_1 = Lab.create!(name: "CDC 4")

    @scientist_1 = Scientist.create!(name: "John Brown", specialty: "Biology", university: "Brown Univeristy", lab_id: @lab_1.id)
    @scientist_2 = Scientist.create!(name: "Alex Mack", specialty: "Chemistry", university: "Penn Univeristy", lab_id: @lab_1.id)

    # @experiment_1 = Experiment.create!(name: "Divergence", objective: "Study Time", num_months: 18)
    # @experiment_2 = Experiment.create!(name: "Universe", objective: "How big is it?", num_months: 36)
    # @experiment_3 = Experiment.create!(name: "Evolution", objective: "Find Ancestors", num_months: 9)

  end

  describe "When I visit a scientist's show page" do
    it "I see all of that scientist's information including: name, specialty, university where they got their degree" do

      visit "/scientists/#{@scientist_1.id}"

      expect(page).to have_content(@scientist_1.name)
      expect(page).to have_content(@scientist_1.specialty)
      expect(page).to have_content(@scientist_1.university)
    end
  end
end