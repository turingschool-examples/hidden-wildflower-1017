require "rails_helper"

RSpec.describe "Experiment Index Page" do
  before(:each) do
    load_test_data
  end
  # As a visitor
  # When I visit the experiment index page
  # I see the names of all long running experiments (longer than 6 months),
  # And I see the names are in descending order (longest to shortest)
  describe "When I visit a scientist's show page" do
    it "I see the names of all long running experiments (longer than 6 months)," do
      visit experiments_path
    
      expect(page).to_not have_content(@experiment_1.name)
      expect(page).to have_content(@experiment_2.name)
    end
  end
  
end 