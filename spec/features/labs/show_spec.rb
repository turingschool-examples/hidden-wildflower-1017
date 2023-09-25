require 'rails_helper'

RSpec.describe "Labs Show", type: :feature do
  before(:each) do
    @lab_1 = Lab.create!(name: "The Testing Locale")
    @lab_2 = Lab.create!(name: "The Fake Lab")
    @scientist_1 = Scientist.create!(name: "Chicken", specialty: "Being afraid", university: "Kiwi's Bird School", lab_id: @lab_1.id)
    @scientist_2 = Scientist.create!(name: "Coco", specialty: "Low brain power", university: "Kiwi's Bird School", lab_id: @lab_1.id)
    @scientist_3 = Scientist.create!(name: "Hiccup", specialty: "Poor flight control", university: "Kiwi's Bird School", lab_id: @lab_1.id)
    @scientist_4 = Scientist.create!(name: "Kila", specialty: "Not even a bird", university: "None", lab_id: @lab_2.id)
    @experiment_1 = Experiment.create!(name: "BrainP", objective: "Determine if we have brains at all", num_months: 17)
    @experiment_2 = Experiment.create!(name: "FlAP", objective: "(Fl)y (A)ll over the (P)lace", num_months: 3)
    @experiment_3 = Experiment.create!(name: "EATM", objective: "EAT ALL THE MILLET", num_months: 50)
    ScientistExperiment.create!(scientist_id: @scientist_1.id, experiment_id: @experiment_2.id)
    ScientistExperiment.create!(scientist_id: @scientist_1.id, experiment_id: @experiment_3.id)
    ScientistExperiment.create!(scientist_id: @scientist_2.id, experiment_id: @experiment_1.id)
    ScientistExperiment.create!(scientist_id: @scientist_2.id, experiment_id: @experiment_2.id)
    ScientistExperiment.create!(scientist_id: @scientist_2.id, experiment_id: @experiment_3.id)
    ScientistExperiment.create!(scientist_id: @scientist_3.id, experiment_id: @experiment_3.id)
  end

  describe "When I visit the labs show page" do
    it "I see the labs name, and the names of all scientists that work at the lab" do
      visit "/labs/#{@lab_1.id}"

      expect(page).to have_content(@lab_1.name)
      expect(page).to have_content(@scientist_1.name)
      expect(page).to have_content(@scientist_2.name)
      expect(page).to have_content(@scientist_3.name)
      expect(page).to_not have_content(@scientist_4.name)
    end

    it "I see the number of experiments associated with each scientist next to their name, and they're sorted by number of experiments descending" do
      visit "/labs/#{@lab_1.id}"

      expect(page).to have_content("#{@scientist_1.name} - Experiments: 2")
      expect(page).to have_content("#{@scientist_2.name} - Experiments: 3")
      expect(page).to have_content("#{@scientist_3.name} - Experiments: 1")

      expect(@scientist_2.name).to appear_before(@scientist_1.name, only_text: true)
      expect(@scientist_1.name).to appear_before(@scientist_3.name, only_text: true)
    end
  end
end