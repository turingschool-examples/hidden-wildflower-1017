require "rails_helper"

RSpec.describe "Mechanics Show Page", type: :feature do
  before :each do
    @lab = Lab.create!(name: "Fermilab")
    
    @scientist_1 = Scientist.create!(name: "Marie Curie", specialty: "radioactivity", university: "University of Paris", lab: @lab)
    @scientist_2 = Scientist.create!(name: "Carsten Lee", specialty: "geology", university: "University of California", lab: @lab)

    @experiment_1 = Experiment.create!(name: "MINERvA", objective: "study neutrino reactions with five different nuclei", num_months: 4)
    @experiment_2 = Experiment.create!(name: "MINERaL", objective: "study minerals in the CA redwoods", num_months: 7)
    @experiment_3 = Experiment.create!(name: "Rockwell", objective: "study rocks in the CA redwoods", num_months: 10)

    @scientist_1.experiments << [@experiment_1]
    @scientist_2.experiments << [@experiment_2, @experiment_3]
  end

  describe "As a visitor" do
    describe "When I visit a scientists show page" do
      it "displays their name, specialty, and university where they got their degree as well as the lab where they work including a list of all of their experiments" do
        visit scientist_path(@scientist_1)

        expect(page).to have_content(@scientist_1.name)
        expect(page).to have_content(@scientist_1.specialty)
        expect(page).to have_content(@scientist_1.university)
        expect(page).to have_content(@lab.name)
        expect(page).to have_content(@experiment_1.name)
      end
    end
  end
end