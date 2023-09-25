require 'rails_helper'

RSpec.describe "Scientist Show Page", type: :feature do
  before(:each) do
    @lab = Lab.create!(name: "Fermilab")
    @scientist = @lab.scientists.create!(name: "Marie Curie", specialty: "radioactivity", university: "University of Paris")
    @scientist_2 = @lab.scientists.create!(name: "Elizabeth Curie", specialty: "radioactivity", university: "University of Paris")
    @experiment = Experiment.create!(name: "MINERvA", description: "study neutrino reactions with five different nuclei", num_months: 4)
    ScientistExperiment.create!(scientist_id: @scientist.id, experiment_id: @experiment.id)
    ScientistExperiment.create!(scientist_id: @scientist_2.id, experiment_id: @experiment.id)
  end

  it "I see all of that scientist's information including: name, speciality, and the university where they got their degree" do 
    visit "/scientists/#{@scientist.id}"

    within('.scientist_attributes') do 
      expect(page).to have_content(@scientist.name)
      expect(page).to have_content(@scientist.specialty)
      expect(page).to have_content(@scientist.university)
      expect(page).to have_content(@lab.name)
    end
  end

  it "I can see the names of all th experiments this scientist is running" do 
    visit "/scientists/#{@scientist.id}"

    within('.scientist_experiments') do 
      expect(page).to have_content(@experiment.name)
    end
  end

  it "I can see a button to remove that experiment from that scientist's work load" do 
    visit "/scientists/#{@scientist.id}"

    within('.scientist_experiments') do 
      expect(page).to have_content(@experiment.name)
      expect(page).to have_button("Remove")
      click_button("Remove")
    end
  end

  it "when experiment is removed, is only removed for that scientist" do 
    visit "/scientists/#{@scientist.id}"

    within('.scientist_experiments') do 
      expect(page).to have_content(@experiment.name)
      expect(page).to have_button("Remove")
      click_button("Remove")
    end

    expect(page).to_not have_content(@experiment.name)

    visit "/scientists/#{@scientist_2.id}"

    within('.scientist_experiments') do 
      expect(page).to have_content(@experiment.name)
    end
  end
end