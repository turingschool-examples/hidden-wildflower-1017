require 'rails_helper'

RSpec.describe "As a visitor when I visit '/scientists/:id'" do
  #US1
  it "see all of that scientist's information, their lab, and their experiments" do
    visit "/scientists/#{@marie_curie.id}"

    expect(page).to have_content(@marie_curie.name)

    within("#scientist-info") do
      expect(page).to have_content("Specialty: #{@marie_curie.specialty}")
      expect(page).to have_content("University: #{@marie_curie.university}")
      expect(page).to have_content("Lab: #{@fermilab.name}")
    end

    within("#experiments") do
      expect(page).to have_content(@minerva.name)
      expect(page).to have_content(@manhattan.name)
      expect(page).not_to have_content(@flat_earth.name)
    end
  end
end