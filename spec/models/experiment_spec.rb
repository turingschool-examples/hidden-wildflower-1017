require 'rails_helper'

RSpec.describe Experiment do
  it { should have_many :experiment_scientists }
  it { should have_many(:scientists).through(:experiment_scientists)}

  before(:each) do
    @radcliffe = Lab.create!(name: "Radcliffe College")
    @other = Lab.create!(name: "Other")

    @payne = Scientist.create(name: "Cecila Payne", specialty: "Astronomy", university: "Harvard", lab: @radcliffe)
    @russell = Scientist.create(name: "Russell", specialty: "Plagarism", university: "other", lab: @other)

    @composition = Experiment.create(name: "Composition", objective: "what a star is made of", num_months: 3)
    @credit = Experiment.create(name: "Payne's paper", objective: "stealing", num_months: 7)
    @break = Experiment.create(name: "Break Glass Ceiling", objective: "be awesome", num_months: 24)
    @stars = Experiment.create(name: "Stars", objective: "more star stuff", num_months: 6)
    @space = Experiment.create(name: "Stars", objective: "more star stuff", num_months: 9)
  
    ExperimentScientist.create(scientist: @payne, experiment: @composition)
    ExperimentScientist.create(scientist: @payne, experiment: @break)
    ExperimentScientist.create(scientist: @payne, experiment: @stars)
    ExperimentScientist.create(scientist: @payne, experiment: @space)
    ExperimentScientist.create(scientist: @russell, experiment: @credit)
  end

  describe ".longer_than(#)" do
    it "can order from longest to shortest experiments over 6 months " do
      expect(Experiment.longer_than(6)).to eq([@break, @space, @credit])
    end
  end
end