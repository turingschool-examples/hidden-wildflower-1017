require 'rails_helper'

RSpec.describe "the Scientist Show page", tpye: :feature do
  describe "As a visitor" do
    describe "When I visit 'scientists/:id'" do
      before :each do
        @lab = Lab.create!(name: "Laboratory")
        @scientist = Scientist.create!(name: "Scientist", specialty: "Science", university: "GoodU", lab_id: @lab.id)
        @experiment1 = Experiment.create!(name: "Experiment 1", objective: "Learn Things", num_months: 12)
        @experiment2 = Experiment.create!(name: "Experiment 2", objective: "Learn More Things", num_months: 36)
        @experiment3 = Experiment.create!(name: "Experiment 3", objective: "Not to Learn Things", num_months: 7)
      
        ScientistExperiment.create!(scientist_id: @scientist.id, experiment_id: @experiment1.id)
        ScientistExperiment.create!(scientist_id: @scientist.id, experiment_id: @experiment2.id)

        visit scientist_path(@scientist)
      end

      it "I see all of that scientists attributes, the lab where they work, the names of all experiments they are running" do
        save_and_open_page
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
    end
  end
end