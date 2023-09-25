require 'rails_helper'

RSpec.describe "Scientists Show page", type: :feature do
  before(:each) do
    @muppet_labs = Lab.create!(name: "Muppet Labs")
    @beaker = @muppet_labs.scientists.create!(name: "Beaker", specialty: "Muppetry", university: "Muppet U")
    @bunsen = @muppet_labs.scientists.create!(name: "Dr. Bunsen Honeydew", specialty: "Muppetry", university: "Muppet U")
    @exp1 = Experiment.create!(name: "The Goo", objective: "Understand the goo", num_months: 10)
    ExperimentScientist.create!(scientist: @beaker, experiment: @exp1)
    ExperimentScientist.create!(scientist: @bunsen, experiment: @exp1)
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
      it "I see a button next to each eperiments name to remove the experiment from that scientist's work load
      When I click the button I am brought back to the scientist show page and no longer see the experiment name
      If I visit a different scientist on that experiment I see their work load has not been affected" do

        visit "/scientists/#{@beaker.id}"

        click_on "Remove"

        expect(page).to_not have_content(@exp1.name)

        visit "/scientists/#{@bunsen.id}"

        expect(page).to have_content(@exp1.name)

      end
    end
  end
end