require "rails_helper"

RSpec.describe "Scientist Show page" do
  before(:each) do
    @radcliffe = Lab.create!(name: "Radcliffe College")
    @other = Lab.create!(name: "Other")

    @payne = Scientist.create(name: "Cecila Payne", specialty: "Stars", university: "Harvard", lab: @radcliffe)
    @russell = Scientist.create(name: "Russell", specialty: "Plagarism", university: "other", lab: @other)

    @composition = Experiment.create(name: "Composition", objective: "what a star is made of", num_months: 3)
    @break = Experiment.create(name: "Break Glass Ceiling", objective: "be awesome", num_months: 24)
    @stars = Experiment.create(name: "Stars", objective: "more star stuff", num_months: 1)
  
    ExperimentScientist.create(scientist: @payne, experiment: @composition)
    ExperimentScientist.create(scientist: @payne, experiment: @break)
    ExperimentScientist.create(scientist: @payne, experiment: @stars)
  end

  it "shows scientists and their attribures" do
    visit scientist_path(@payne)

    expect(page).to have_content(@payne.name)
    expect(page).to have_content(@payne.specialty)
    expect(page).to have_content(@payne.university)
    expect(page).to_not have_content(@russell.university)

    expect(page).to have_content(@radcliffe.name)

    expect(page).to have_content(@composition.name)
    expect(page).to have_content(@break.name)
    expect(page).to have_content(@stars.name)
  end

  it "can remove experiment from scientist" do
    visit scientist_path(@payne)

    expect(page).to have_content(@composition.name)
    expect(page).to have_content(@break.name)
    expect(page).to have_content(@stars.name)

    expect(page).to have_button("Delete #{@stars.name}")

    click_button "Delete #{@stars.name}"

    expect(page).to have_content(@composition.name)
    expect(page).to have_content(@break.name)
    expect(page).to_not have_content(@stars.name)
  end
end
    