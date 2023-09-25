require 'rails_helper'

RSpec.describe "Scientists Show Page" do
    before :each do
     @lab1 = Lab.create!(name: 'Lab A')
     @lab2 = Lab.create!(name: 'Lab B')

     @scientist1 = Scientist.create!(
     name: 'Tiny Tim',
     specialty: 'Biologist',
     university: 'University of Science',
     lab: @lab1
     )

     @scientist2 = Scientist.create!(
     name: 'Roger Rabbit',
     specialty: 'Chemist',
     university: 'Chemistry University',
     lab: @lab2
     )

     @experiment1 = Experiment.create!(
     name: 'SCP 900',
     objective: 'Study DNA replication',
     num_months: 6
     )

     @experiment2 = Experiment.create!(
     name: 'SCP 205',
     objective: 'Chemical analysis',
     num_months: 9
     )

     @experiment3 = Experiment.create!(
     name: 'SCP 100',
     objective: 'Chemical analysis',
     num_months: 9
     )

     ScientistExperiment.create!(scientist: @scientist1, experiment: @experiment1)
     ScientistExperiment.create!(scientist: @scientist1, experiment: @experiment2)
     ScientistExperiment.create!(scientist: @scientist2, experiment: @experiment2)
     ScientistExperiment.create!(scientist: @scientist2, experiment: @experiment3)
    end
    describe "Scientist information" do
        it "displays scientist info" do
          visit "/scientists/#{@scientist1.id}"

          expect(page).to have_content(@scientist1.name)
          expect(page).to have_content(@scientist1.specialty)
          expect(page).to have_content(@scientist1.university)
          expect(page).not_to have_content(@scientist2.name)
          expect(page).not_to have_content(@scientist2.specialty)
          expect(page).not_to have_content(@scientist2.university)
        end

        it "displays lab name" do
          visit "/scientists/#{@scientist1.id}"

          expect(page).to have_content(@scientist1.lab.name)
          expect(page).not_to have_content(@scientist2.lab.name)
        end

        it "displays names of experiments" do
          visit "/scientists/#{@scientist1.id}"

          expect(page).to have_content(@experiment1.name)
          expect(page).to have_content(@experiment2.name)
          expect(page).not_to have_content(@experiment3.name)
        end
    end  
end