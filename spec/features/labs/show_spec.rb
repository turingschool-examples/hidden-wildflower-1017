require 'rails_helper'

RSpec.describe "As a visitor when I visit '/labs/:id'" do
  before :each do
    load_test_data
  end

  #EXT
  it "I see the lab's name, the names of all scientists at the lab ordered by number of experiments, and the number of experiments" do
    visit "/labs/#{@fermilab.id}"

    expect(page).to have_content(@fermilab.name)

    within("#scientists") do
      expect(@curie.name).to appear_before(@feynman.name)
      expect(page).not_to have_content(@sagan.name)

      within("#scientist-#{@curie.id}") do
        expect(@curie.experiments.count).to eq(2)
        expect(page).to have_content(@curie.experiments.count)
      end
    end
  end
end