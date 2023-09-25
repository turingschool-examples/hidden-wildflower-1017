require 'rails_helper'

RSpec.describe 'When a user visits a scientist show page', type: :feature do
  before :each do
    @lab = Lab.create!(name: "Hinkey Lab")

    @scientist_1 = @lab.scientists.create!(name: "Darnell", specialty: "Cell Research", university: "USC")
    @experiment_1 = Experiment.create!(name: "Cell Division #1", objective: "To improve cell research", num_months: 60)
    @experiment_2 = Experiment.create!(name: "Stem Division #2", objective: "To improve stem research", num_months: 48)

    @scientist_1_experiment_1 = @scientist_1.scientist_experiments.create!(scientist: @scientist_1, experiment: @experiment_1)
    @scientist_1_experiment_2 = @scientist_1.scientist_experiments.create!(scientist: @scientist_1, experiment: @experiment_2)
  end

  # US 1
  it 'displays all the scientist information' do
    visit "/scientists/#{@scientist_1.id}"

    expect(page).to have_content("#{@scientist_1.name}")
    expect(page).to have_content("#{@scientist_1.specialty}")
    expect(page).to have_content("#{@scientist_1.university}")
  end

  # US 1
  it 'displays the name of the lab and the names of all experiments the scientist is running' do
    visit "/scientists/#{@scientist_1.id}"

    expect(page).to have_content("#{@lab.name}")
    expect(page).to have_content("#{@experiment_1.name}")
    expect(page).to have_content("#{@experiment_2.name}")
  end
end
