require "rails_helper"

RSpec.describe "Mechanics Show Page", type: :feature do
  before :each do
    @lab = Lab.create!(name: "Fermilab")
    
    @scientist_1 = Scientist.create!(name: "Marie Curie", specialty: "radioactivity", university: "University of Paris", lab: @lab)
    @scientist_2 = Scientist.create!(name: "Carsten Lee", specialty: "geology", university: "University of California", lab: @lab)

    @experiment_1 = Experiment.create!(name: "MINERvA", objective: "study neutrino reactions with five different nuclei", num_months: 4)
    @experiment_2 = Experiment.create!(name: "MINERaL", objective: "study minerals in the CA redwoods", num_months: 5)
    @experiment_3 = Experiment.create!(name: "Rockwell", objective: "study rocks in the CA redwoods", num_months: 10)
    @experiment_4 = Experiment.create!(name: "Galaxies", objective: "study the galaxies in the universe", num_months: 12)

    @scientist_1.experiments << [@experiment_1]
    @scientist_2.experiments << [@experiment_1, @experiment_2, @experiment_3]
  end

  describe "as a visitor" do
    describe "when I visit the experiment index page" do
      it "then I see the names of all long running experiments (longer than 6 months) as well as the names are in descending order (longest to shortest)" do
        visit experiments_path

        expect(page).to have_selector('li', text: "Rockwell")
        expect(page).to have_selector('li', text: "Galaxies")
       
        expect(page).not_to have_selector('li', text: "MINERvA")
        expect(page).not_to have_selector('li', text: "MINERaL")
        save_and_open_page
      end
    end
  end
end