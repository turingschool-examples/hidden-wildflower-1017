require 'rails_helper'

RSpec.describe 'When a user visits the experiment index page', type: :feature do
  before :each do
    @lab = Lab.create!(name: "Hinkey Lab")

    @scientist_1 = @lab.scientists.create!(name: "Darnell", specialty: "Cell Research", university: "USC")
    @experiment_1 = Experiment.create!(name: "Cell Division #1", objective: "To improve cell research", num_months: 4)
    @experiment_2 = Experiment.create!(name: "Stem Division #2", objective: "To improve stem research", num_months: 48)
    @experiment_3 = Experiment.create!(name: "Bone Division #3", objective: "To improve bone research", num_months: 10)

    @scientist_1_experiment_1 = @scientist_1.scientist_experiments.create!(scientist: @scientist_1, experiment: @experiment_1)
    @scientist_1_experiment_2 = @scientist_1.scientist_experiments.create!(scientist: @scientist_1, experiment: @experiment_2)
    @scientist_1_experiment_3 = @scientist_1.scientist_experiments.create!(scientist: @scientist_1, experiment: @experiment_3)
  end

  # US 3
  it 'displays all experiments longer than 6 months' do
    visit "/experiments"

    expect(@experiment_2.name).to appear_before(@experiment_3.name)
  end
end