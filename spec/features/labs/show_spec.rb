require "rails_helper"

RSpec.describe "Lab Show page" do
  before(:each) do
    @radcliffe = Lab.create!(name: "Radcliffe College")
    @other = Lab.create!(name: "Other")

    @payne = Scientist.create(name: "Cecila Payne", specialty: "Astronomy", university: "Harvard", lab: @radcliffe)
    @russell = Scientist.create(name: "Russell", specialty: "Plagarism", university: "other", lab: @radcliffe)
    @sergei = Scientist.create(name: "Sergei Gaposchkin", specialty: "Plagarism", university: "other", lab: @radcliffe)

    @composition = Experiment.create(name: "Composition", objective: "what a star is made of", num_months: 3)
    @break = Experiment.create(name: "Break Glass Ceiling", objective: "be awesome", num_months: 24)
    @stars = Experiment.create(name: "Stars", objective: "more star stuff", num_months: 6)
    @space = Experiment.create(name: "Space", objective: "everything", num_months: 9)
    @planets = Experiment.create(name: "Planets", objective: "planets", num_months: 5)
    @credit = Experiment.create(name: "Payne's paper", objective: "stealing", num_months: 7)
  
    ExperimentScientist.create(scientist: @payne, experiment: @composition)
    ExperimentScientist.create(scientist: @payne, experiment: @break)
    ExperimentScientist.create(scientist: @payne, experiment: @stars)
    ExperimentScientist.create(scientist: @payne, experiment: @space)

    ExperimentScientist.create(scientist: @russell, experiment: @credit)

    ExperimentScientist.create(scientist: @sergei, experiment: @space)
    ExperimentScientist.create(scientist: @sergei, experiment: @stars)
    ExperimentScientist.create(scientist: @sergei, experiment: @planets)
  end

  it "shows the names and count of experiments" do
    visit lab_path(@radcliffe)

    expect(find("#scientist-#{@payne.id}")).to have_content(4)
    expect(find("#scientist-#{@sergei.id}")).to have_content(3)
    expect(find("#scientist-#{@russell.id}")).to have_content(1)
  end

  it "shows the names in order of most experiments ot least" do
    visit lab_path(@radcliffe)

    expect(@payne.name).to appear_before(@sergei.name)
    expect(@sergei.name).to appear_before(@russell.name)
  end