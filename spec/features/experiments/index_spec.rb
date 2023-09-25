require 'rails_helper'

RSpec.describe "Experiments Index page", type: :feature do
  before(:each) do
    @exp1 = Experiment.create!(name: "The Goo", objective: "Understand the goo", num_months: 10)
    @exp2 = Experiment.create!(name: "Study Gonzo", objective: "Is Alien?", num_months: 1)
    @exp3 = Experiment.create!(name: "Make Rocket", objective: "Strap Gonzo to Rocket", num_months: 8)
  end
  describe "As a visitor" do
    describe "When I visit /experiments" do
      it "I see the names of all long running experiments (longer than 6 months),
      And I see the names are in descending order (longest to shortest)" do

        visit "/experiments"

        expect(page).to_not have_content(@exp2.name)
        expect(exp1.name).to appear_before(exp3.name)

      end
    end
  end
end