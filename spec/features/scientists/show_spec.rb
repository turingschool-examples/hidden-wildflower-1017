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
      within("#experiment-#{@minerva.id}") do
        expect(page).to have_content(@minerva.name)
      end

      within("#experiment-#{@manhattan.id}") do
        expect(page).to have_content(@manhattan.name)
      end

      expect(page).not_to have_content(@voyager.name)
    end
  end

  #US2
  it "next to each experiment's name, I see a button to remove that experiment from that scientist's work load" do
    visit "/scientists/#{@curie.id}"

    within("#experiments") do
      within("#experiment-#{@manhattan.id}") do
        click_button "Remove Experiment"
      end
    end

    expect(current_path).to eq("/scientists/#{@curie.id}")

    within("#experiments") do
      within("#experiment-#{@minerva.id}") do
        expect(page).to have_content(@minerva.name)
      end

      expect(page).not_to have_content(@manhattan.name)
    end

    visit "/scientists/#{@feynman.id}"

    within("#experiments") do
      within("#experiment-#{@manhattan.id}") do
        expect(page).to have_content(@manhattan.name)
      end
    end
  end
end