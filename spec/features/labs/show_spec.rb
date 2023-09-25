require 'rails_helper'

RSpec.describe "the Scientist Show page", tpye: :feature do
  describe "As a visitor" do
    describe "When I visit 'scientists/:id'" do
      it "I see the names of all scientists that work for this lab, and next to them is the count of ongoing experiments, they are order from most to least" do
        lab = Lab.create!(name: "Laboratory")
        scientist1 = Scientist.create!(name: "Scientist 1", specialty: "Science", university: "GoodU", lab_id: lab.id)
        scientist2 = Scientist.create!(name: "Scientist 2", specialty: "Different Science", university: "NotasGoodU", lab_id: lab.id)
        scientist3 = Scientist.create!(name: "Scientist 3", specialty: "All the Science", university: "WayBetterU", lab_id: lab.id)
        experiment1 = Experiment.create!(name: "Experiment 1", objective: "Learn Things", num_months: 12)
        experiment2 = Experiment.create!(name: "Experiment 2", objective: "Learn More Things", num_months: 36)
        experiment3 = Experiment.create!(name: "Experiment 3", objective: "Not to Learn Things", num_months: 7)
      
        ScientistExperiment.create!(scientist_id: scientist1.id, experiment_id: experiment1.id)
        ScientistExperiment.create!(scientist_id: scientist1.id, experiment_id: experiment2.id)
        ScientistExperiment.create!(scientist_id: scientist2.id, experiment_id: experiment1.id)
        ScientistExperiment.create!(scientist_id: scientist3.id, experiment_id: experiment1.id)
        ScientistExperiment.create!(scientist_id: scientist3.id, experiment_id: experiment2.id)
        ScientistExperiment.create!(scientist_id: scientist3.id, experiment_id: experiment3.id)

        visit lab_path(lab)

        expect(page).to have_content(lab.name)
        expect(scientist3.name).to appear_before(scientist1.name)
        expect(scientist1.name).to appear_before(scientist2.name)
        
        within("#scientists") do
          within("#scientist-#{scientist1.id}") do
            expect(scientist1.name).to appear_before("Number of Experiments: 2")
          end

          within("#scientist-#{scientist2.id}") do
            expect(scientist2.name).to appear_before("Number of Experiments: 1")
          end

          within("#scientist-#{scientist3.id}") do
            expect(scientist3.name).to appear_before("Number of Experiments: 3")
          end
        end
      end
    end
  end
end