require "rails_helper"

RSpec.describe "Experiment Index Page", type: :feature do
  before(:each) do
    @experiment_1 = Experiment.create(
      name: "MINERvA",
      objective: "study neutrino reactions with five different nuclei",
      num_months: 9
    )

    @experiment_2 = Experiment.create(
      name: "Cell Structure under Intense Heat",
      objective: "study the changes in cell structure in extreme heat",
      num_months: 5
    )

    @experiment_3 = Experiment.create(
      name: "How silly is too silly",
      objective: "understanding the impact of being silly",
      num_months: 15
    )

    visit experiments_path
  end
  describe "as a visitor" do
    describe "when I visit the experiment index page" do
      it "I see the names of all long running experiments (longer than 6 months), and I see the names are in descending order (longest to shortest)" do
        expect(page).to have_content("Experiments Index")
        
        within("#experiments") do
          expect(page).to have_content(@experiment_1.name)
          expect(page).to have_content(@experiment_3.name)
          expect(page).not_to have_content(@experiment_2.name)

          expect(@experiment_3.name).to appear_before(@experiment_1.name)
        end
      end
    end
  end
end