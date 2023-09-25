require 'rails_helper'

RSpec.describe "the Scientist Show page", tpye: :feature do
  describe "As a visitor" do
    describe "When I visit 'scientists/:id'" do
      before :each do
        @lab = Lab.create!(name: "Laboratory")
        @scientist = Scientist.create!(name: "Scientist", specialty: "Science", university: "GoodU", lab_id: @lab.id)
        @scientist2 = Scientist.create!(name: "Scientist 2", specialty: "Different Science", university: "NotasGoodU", lab_id: @lab.id)
        @experiment1 = Experiment.create!(name: "Experiment 1", objective: "Learn Things", num_months: 12)
        @experiment2 = Experiment.create!(name: "Experiment 2", objective: "Learn More Things", num_months: 36)
        @experiment3 = Experiment.create!(name: "Experiment 3", objective: "Not to Learn Things", num_months: 7)
      
        ScientistExperiment.create!(scientist_id: @scientist.id, experiment_id: @experiment1.id)
        ScientistExperiment.create!(scientist_id: @scientist.id, experiment_id: @experiment2.id)
        ScientistExperiment.create!(scientist_id: @scientist2.id, experiment_id: @experiment1.id)

        visit scientist_path(@scientist)
      end

      it "I see all of that scientists attributes, the lab where they work, the names of all experiments they are running" do

        expect(page).to have_content(@scientist.name)
        expect(page).to have_content(@scientist.specialty)
        expect(page).to have_content(@scientist.university)
        expect(page).to have_content(@scientist.lab_name)
        expect(page).not_to have_content(@experiment3.name)
        expect(page).not_to have_content(@experiment3.objective)
        expect(page).not_to have_content(@experiment3.num_months)

        within("#experiment-#{@experiment1.id}") do
          expect(page).to have_content(@experiment1.name)
          expect(page).to have_content(@experiment1.objective)
          expect(page).to have_content(@experiment1.num_months)
          expect(page).not_to have_content(@experiment2.name)
          expect(page).not_to have_content(@experiment2.objective)
          expect(page).not_to have_content(@experiment2.num_months)
        end

        within("#experiment-#{@experiment2.id}") do
          expect(page).to have_content(@experiment2.name)
          expect(page).to have_content(@experiment2.objective)
          expect(page).to have_content(@experiment2.num_months)
          expect(page).not_to have_content(@experiment1.name)
          expect(page).not_to have_content(@experiment1.objective)
          expect(page).not_to have_content(@experiment1.num_months)
        end
      end

      it "Next to each experiment's name I see a button to remove that experiment from workload, I clikc it and am brought back to the scientist's show page where I no longer see the experiment" do
        expect(page).to have_button("Remove from Workload")

        click_button "Remove from Workload", match: :first

        expect(current_path).to eq(scientist_path(@scientist))

        expect(page).not_to have_content(@experiment1.name)
        expect(page).not_to have_content(@experiment1.objective)
        expect(page).not_to have_content(@experiment1.num_months)
      end

      it "After removing an experiment from one scientist I see that it still exists on others conducting the same experiment" do
        click_button "Remove from Workload", match: :first

        expect(current_path).to eq(scientist_path(@scientist))

        expect(page).not_to have_content(@experiment1.name)
        expect(page).not_to have_content(@experiment1.objective)
        expect(page).not_to have_content(@experiment1.num_months)

        visit scientist_path(@scientist2)

        within("#experiment-#{@experiment1.id}") do
          expect(page).to have_content(@experiment1.name)
          expect(page).to have_content(@experiment1.objective)
          expect(page).to have_content(@experiment1.num_months)
        end
      end
    end
  end
end