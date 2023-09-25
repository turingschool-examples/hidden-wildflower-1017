require "rails_helper"

RSpec.describe "Experiments index page" do
  before(:each) do
    @radcliffe = Lab.create!(name: "Radcliffe College")
    @other = Lab.create!(name: "Other")

    @payne = Scientist.create(name: "Cecila Payne", specialty: "Astronomy", university: "Harvard", lab: @radcliffe)
    @russell = Scientist.create(name: "Russell", specialty: "Plagarism", university: "other", lab: @other)

    @composition = Experiment.create(name: "Composition", objective: "what a star is made of", num_months: 3)
    @break = Experiment.create(name: "Break Glass Ceiling", objective: "be awesome", num_months: 24)
    @stars = Experiment.create(name: "Stars", objective: "more star stuff", num_months: 6)
    @space = Experiment.create(name: "Space", objective: "everything", num_months: 9)
    @credit = Experiment.create(name: "Payne's paper", objective: "stealing", num_months: 7)
  
    ExperimentScientist.create(scientist: @payne, experiment: @composition)
    ExperimentScientist.create(scientist: @payne, experiment: @break)
    ExperimentScientist.create(scientist: @payne, experiment: @stars)
    ExperimentScientist.create(scientist: @payne, experiment: @space)
    ExperimentScientist.create(scientist: @russell, experiment: @credit)
  end

  it "shows only experiments lasting more than 6 months" do
    visit experiments_path

    expect(page).to have_content(@break.name)
    expect(page).to have_content(@space.name)
    expect(page).to have_content(@credit.name)

    expect(page).to_not have_content(@composition.name)
    expect(page).to_not have_content(@stars.name)
  end

  it "shown experiments are is order by number of months longest to shortest" do
    visit experiments_path

    expect(@break.name).to appear_before(@space.name)
    expect(@space.name).to appear_before(@credit.name)
  end
end

