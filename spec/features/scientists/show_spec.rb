require 'rails_helper'

RSpec.describe "Scientists Show", type: :feature do
  before(:each) do
    @lab_1 = Lab.create!(name: "The Testing Locale")
    @scientist_1 = Scientist.create!(name: "Chicken", specialty: "Being afraid", university: "Kiwi's Bird School", lab_id: @lab_1.id)
    @experiment_1 = Experiment.create!(name: "BrainP", objective: "Determine if we have brains at all", num_months: 17)
    @experiment_2 = Experiment.create!(name: "FlAP", objective: "(Fl)y (A)ll over the (P)lace", num_months: 3)
    @experiment_3 = Experiment.create!(name: "EATM", objective: "EAT ALL THE MILLET", num_months: 50)
    ScientistExperiment.create!(scientist_id: @scientist_1.id, experiment_id: @experiment_1.id)
    ScientistExperiment.create!(scientist_id: @scientist_1.id, experiment_id: @experiment_3.id)
  end

  describe "When I visit the scientists show page" do
    it "I see all of that scientists information" do
      visit "/scientists/#{@scientist_1.id}"

      expect(page).to have_content(@scientist_1.name)
      expect(page).to have_content(@scientist_1.specialty)
      expect(page).to have_content(@scientist_1.university)
    end

    it "I see the name of the lab the scientist works at and all of their experiments" do
      visit "/scientists/#{@scientist_1.id}"

      expect(page).to have_content(@lab_1.name)
      expect(page).to have_content(@experiment_1.name)
      expect(page).to have_content(@experiment_1.objective)
      expect(page).to have_content(@experiment_3.name)
      expect(page).to have_content(@experiment_3.objective)

      expect(page).to_not have_content(@experiment_2.name)
      save_and_open_page
    end
  end
end