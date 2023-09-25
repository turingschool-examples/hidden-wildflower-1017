require 'rails_helper'

RSpec.describe "Scientists Show page", type: :feature do
  before(:each) do
    @muppet_labs = Lab.create!(name: "Muppet Labs")
    @beaker = @muppet_labs.scientists.create!(name: "Beaker", specialty: "Muppetry", university: "Muppet U")
    @exp1 = Experiment.create!(name: "The Goo", objective: "Understand the goo", num_months: 10)
    ExperimentScientist.create!(scientist: @beaker, experiment: @exp1)
  end
  describe "As a visitor" do
    describe "When I visit /scientists/:id" do
      it "I see all of that scientist's information including:
      - name
      - specialty
      - university where they got their degree
     And I see the name of the lab where this scientist works
     And I see the names of all of the experiments this scientist is running" do

      visit "/scientists/#{@beaker.id}"

      expect(page).to have_content(@beaker.name)
      expect(page).to have_content(@beaker.specialty)
      expect(page).to have_content(@beaker.university)
      expect(page).to have_content(@muppet_labs.name)
      expect(page).to have_content(@exp1.name)
     end
    end
  end
end