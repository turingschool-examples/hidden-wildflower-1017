require 'rails_helper'

RSpec.describe "the Experiments index page", tpye: :feature do
  describe "As a visitor" do
    describe "When I visit '/experiments'" do
      it "I see the name of all long running experiments (longer than 6 month), and I see the names are in descending order" do
        experiment1 = Experiment.create!(name: "Experiment 1", objective: "Learn Things", num_months: 12)
        experiment2 = Experiment.create!(name: "Experiment 2", objective: "Learn More Things", num_months: 36)
        experiment3 = Experiment.create!(name: "Experiment 3", objective: "Not to Learn Things", num_months: 5)
      
        visit experiments_path
  
        expect(experiment2.name).to appear_before(experiment1.name)
        expect(page).not_to have_content(experiment3.name)
      end
    end
  end
end