require "rails_helper"

RSpec.describe "Scientist Show Page" do
  before(:each) do
    load_test_data
  end
# As a visitor
# When I visit a scientist's show page
# I see all of that scientist's information including:
#  - name
#  - specialty
#  - university where they got their degree
# And I see the name of the lab where this scientist works
# And I see the names of all of the experiments this scientist is running
  describe "When I visit a scientist's show page" do
    it "I see all of that scientist's information" do
      visit scientist_path(@scientist_1)
    
      expect(page).to have_content(@scientist_1.name)
      expect(page).to have_content(@scientist_1.lab.name)
      expect(page).to have_content(@experiment_1.name)
      expect(page).to have_content(@experiment_2.name)
      
    end

#     Then next to each experiment's name, I see a button to remove that experiment from that scientist's work load
# When I click that button for one experiment
# I'm brought back to the scientist's show page
# And I no longer see that experiment's name listed
# And when I visit a different scientist's show page that is working on that same experiment,
# Then I see that the experiment is still on the other scientist's work load

    it "I see a button to remove experiment" do
      visit scientist_path(@scientist_1)

      expect(page).to have_content(@scientist_1.name)
      expect(page).to have_content(@scientist_1.lab.name)
      expect(page).to have_content(@experiment_1.name)
      expect(page).to have_content(@experiment_2.name)
      
      within("##{@experiment_1.id}") do
          click_button "Remove"
      end

      expect(page).to_not have_content(@experiment_1.name)
      expect(page).to have_content(@experiment_2.name)
      
      visit scientist_path(@scientist_2)
      
      expect(page).to have_content(@experiment_1.name)
    end
  end
  
end 