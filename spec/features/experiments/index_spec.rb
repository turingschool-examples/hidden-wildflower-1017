require 'rails_helper'

RSpec.describe "As a visitor when I visit '/experiments" do
  before :each do
    load_test_data
  end

  #US3
  it "I see the names of all long running experiments in descending order of expermient length (longer than 6 months)" do
    visit "/experiments"

    within("#long_experiments") do
      expect(@voyager.name).to appear_before(@manhattan.name)
      expect(page).not_to have_content(@minerva.name)
    end
  end
end