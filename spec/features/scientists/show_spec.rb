require 'rails_helper'

RSpec.describe "As a visitor when I visit '/scientists/:id'" do
  before :each do
    load_test_data
  end
  #US1
  it "see all of that scientist's information, their lab, and their experiments" do
    visit "/scientists/#{@curie.id}"

    expect(page).to have_content(@curie.name)

    within("#scientist-info") do
      expect(page).to have_content("Specialty: #{@curie.specialty}")
      expect(page).to have_content("University: #{@curie.university}")
      expect(page).to have_content("Lab: #{@fermilab.name}")
    end

    within("#experiments") do
      expect(page).to have_content(@minerva.name)
      expect(page).to have_content(@manhattan.name)
      expect(page).not_to have_content(@voyager.name)
    end
  end
end