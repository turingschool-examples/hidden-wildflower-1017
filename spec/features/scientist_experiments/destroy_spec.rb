require "rails_helper"

RSpec.describe "scientists show page" do
  before(:each) do
    @lab_1 = Lab.create!(name: "CDC 4")

    @scientist_1 = Scientist.create!(name: "John Brown", specialty: "Biology", university: "Brown Univeristy", lab_id: @lab_1.id)
    @scientist_2 = Scientist.create!(name: "Alex Mack", specialty: "Chemistry", university: "Penn Univeristy", lab_id: @lab_1.id)

    @experiment_1 = Experiment.create!(name: "Divergence", objective: "Study Time", num_months: 18)
    @experiment_2 = Experiment.create!(name: "Universe", objective: "How big is it?", num_months: 36)
    @experiment_3 = Experiment.create!(name: "Evolution", objective: "Find Ancestors", num_months: 9)

    @john_experiment_1 = @scientist_1.scientist_experiments.create!(scientist_id: @scientist_1.id, experiment_id: @experiment_1.id)
    @john_experiment_2 = @scientist_1.scientist_experiments.create!(scientist_id: @scientist_1.id, experiment_id: @experiment_2.id)
    @alex_experiment_1 = @scientist_2.scientist_experiments.create!(scientist_id: @scientist_2.id, experiment_id: @experiment_3.id)
    @alex_experiment_2 = @scientist_2.scientist_experiments.create!(scientist_id: @scientist_2.id, experiment_id: @experiment_1.id)

  end


  describe "as a visitor" do
    it "next to each experiment's name, I see a button to remove that experiment from that scientist's work load" do
      visit "/scientists/#{@scientist_1.id}"

      within("#Divergence") do
        expect(page).to have_content(@experiment_1.name)
        expect(page).to have_button("Remove experiment")
      end
        
      within("#Universe") do
        expect(page).to have_content(@experiment_2.name)
        expect(page).to have_button("Remove experiment")
      end
    end

    it "When I click that button for one experiment, I'm brought back to the scientist's show page" do
      visit "/scientists/#{@scientist_1.id}"
      
      within("#Divergence") do
        click_button "Remove experiment"
        expect(current_path).to eq("/scientists/#{@scientist_1.id}")
      end

      expect(page).to_not have_content(@experiment_1.name)
      expect(page).to have_content(@experiment_2.name)
    end
  end
end