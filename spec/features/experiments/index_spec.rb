require "rails_helper"

RSpec.describe "Experiments Index Page" do
  describe "As a visitor" do
    it "I see the names of all experiments whose length is greater than 6 months and they are ordered from longest to shortest" do
      experiment_1 = Experiment.create!(name: "Actinium", description: "Porro iste architecto eum.", num_months: 12)
      experiment_2 = Experiment.create!(name: "Niobium", description: "Expedita error dolor corrupti.", num_months: 11)
      experiment_3 = Experiment.create!(name: "Promethium", description: "Quis ut aut odit.", num_months: 8)
      experiment_4 = Experiment.create!(name: "Argon", description: "Eos qui deleniti possimus.", num_months: 7)
      experiment_5 = Experiment.create!(name: "Radon", description: "Quas dolores fuga reiciendis.", num_months: 4)
      experiment_6 = Experiment.create!(name: "Silicon", description: "Ipsa dolorem doloremque dolorem.", num_months: 3)

      visit "/experiments"

      within "#Experiments" do
        expect(page).to have_content(experiment_3.name)
        expect(page).to have_content(experiment_3.description)
        expect(page).to have_content(experiment_3.num_months)

        expect(page).to have_content(experiment_1.name)

        expect(page).to_not have_content(experiment_5.name)
        expect(page).to_not have_content(experiment_6.name)
        
        expect(experiment_1.name).to appear_before(experiment_3.name)
        expect(experiment_3.name).to appear_before(experiment_4.name)
      end
    end
  end
end