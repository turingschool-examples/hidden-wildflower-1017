require "rails_helper"

RSpec.describe "experiment#index" do
  before(:each) do
    @experiment_1 = Experiment.create!(name: "MINERvA", objective: "study neutrino reactions with five different nuclei", num_months: 4)
    @experiment_2 = Experiment.create!(name: "BeardTech", objective: "study beard growth in little boys with german accents", num_months: 6)
    @experiment_3 = Experiment.create!(name: "LongBoi", objective: "study how long it takes for Cory to learn coding", num_months: 8)
  end

  describe "details" do
    it "shows the names of all the long running experiments (longer than 6 months) 
    and shows the names in descending order (longest to shortest)" do
      visit "/experiments"

      expect(page).to have_content(@experiment_3.name)
      expect(page).to have_content(@experiment_2.name)

      expect(@experiment_3.name).to appear_before(@experiment_2.name)
      save_and_open_page
    end
  end
end

# User Story 3, Experiment Index Page

# As a visitor
# When I visit the experiment index page
# I see the names of all long running experiments (longer than 6 months),
# And I see the names are in descending order (longest to shortest)
