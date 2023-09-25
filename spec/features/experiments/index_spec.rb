require 'rails_helper'

RSpec.describe "Experiment Index Page" do
  it "displays long-running experiments in descending order" do
    experiment1 = Experiment.create!(
      name: 'SCP 900',
      objective: 'See what it does',
      num_months: 9
    )

    experiment2 = Experiment.create!(
      name: 'SCP 800',
      objective: 'No one wants this one',
      num_months: 12
    )

    experiment3 = Experiment.create!(
      name: 'SCP 700',
      objective: 'Quick and easy',
      num_months: 3
    )

    visit "/experiments"

    expect(page).to have_content(experiment2.name)
    expect(page).to have_content(experiment1.name)
    expect(experiment2.name).to appear_before(experiment1.name)
    expect(page).not_to have_content(experiment3.name)
  end
end