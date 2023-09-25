require 'rails_helper'

RSpec.describe "Experiments Index", type: :feature do
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

  describe "When I visit the experiments index page" do
    it "I see the names of all running experiments (longer than 6 months), and they are in descending order (longest to shortest)" do
      visit "/experiments"

      expect(@experiment_3.name).to appear_before(@experiment_1.name, text_only: true)
      expect(page).to_not have_content(@experiment_2.name)
    end
  end
end