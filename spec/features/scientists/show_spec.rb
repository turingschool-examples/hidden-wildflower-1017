require 'rails_helper'

RSpec.describe "Scientists Show", type: :feature do
  before(:each) do
    @lab_1 = Lab.create!(name: "The Testing Locale")
    @scientist_1 = Scientist.create!(name: "Chicken", specialty: "Being afraid", university: "Kiwi's Bird School", lab_id: @lab_1.id)
    @scientist_2 = Scientist.create!(name: "Coco", specialty: "Low brain power", university: "Kiwi's Bird School", lab_id: @lab_1.id)
    @experiment_1 = Experiment.create!(name: "BrainP", objective: "Determine if we have brains at all", num_months: 17)
    @experiment_2 = Experiment.create!(name: "FlAP", objective: "(Fl)y (A)ll over the (P)lace", num_months: 3)
    @experiment_3 = Experiment.create!(name: "EATM", objective: "EAT ALL THE MILLET", num_months: 50)
    ScientistExperiment.create!(scientist_id: @scientist_1.id, experiment_id: @experiment_1.id)
    ScientistExperiment.create!(scientist_id: @scientist_1.id, experiment_id: @experiment_3.id)
    ScientistExperiment.create!(scientist_id: @scientist_2.id, experiment_id: @experiment_2.id)
    ScientistExperiment.create!(scientist_id: @scientist_2.id, experiment_id: @experiment_3.id)
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

    it "I see a button next to each experiment that removes that experiment from the scientists workload" do
      visit "/scientists/#{@scientist_1.id}"

      within("#experiment-#{@experiment_1.id}") do
        expect(page).to have_button("Remove Experiment")
      end

      within("#experiment-#{@experiment_3.id}") do
        expect(page).to have_button("Remove Experiment")
        click_button("Remove Experiment")
      end

      expect(page).to have_current_path("/scientists/#{@scientist_1.id}")
      expect(page).to have_content(@experiment_1.name)
      expect(page).to_not have_content(@experiment_3.name)
    end

    it "A removed experiment does not impact other scientists working on that experiment" do
      visit "/scientists/#{@scientist_1.id}"

      within("#experiment-#{@experiment_3.id}") do
        click_button("Remove Experiment")
      end

      visit "/scientists/#{@scientist_2.id}"

      expect(page).to have_content(@experiment_3.name)
    end
  end
end