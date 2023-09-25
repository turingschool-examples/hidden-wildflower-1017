require "rails_helper"

RSpec.describe "the scientists show page" do
  it "displays the name, specialty, university, and current lab" do
    lab = Lab.create!(name: "Weesh Industries")
    scientist = lab.scientists.create!(name: "Eric Dean", specialty: "Marine Biology", university: "CSULB")
    experiment_1 = Experiment.create!(name: "Fish", objective: "Look at fish", num_months: 22, scientists: [scientist])
    experiment_2 = Experiment.create!(name: "Danger", objective: "Mix dangerous chemicals", num_months: 5, scientists: [scientist])

    visit "/scientists/#{scientist.id}"

    expect(page).to have_content(scientist.name)
    expect(page).to have_content(scientist.specialty)
    expect(page).to have_content(scientist.university)
    expect(page).to have_content(lab.name)

  end

  it "displays all current experiments" do
    lab = Lab.create!(name: "Weesh Industries")
    scientist = lab.scientists.create!(name: "Eric Dean", specialty: "Marine Biology", university: "CSULB")
    experiment_1 = Experiment.create!(name: "Fish", objective: "Look at fish", num_months: 22, scientists: [scientist])
    experiment_2 = Experiment.create!(name: "Danger", objective: "Mix dangerous chemicals", num_months: 5, scientists: [scientist])

    visit "/scientists/#{scientist.id}"

    expect(page).to have_content(experiment_1.name)
    expect(page).to have_content(experiment_2.name)
  end

  it "has a remove button" do
    lab = Lab.create!(name: "Weesh Industries")
    scientist = lab.scientists.create!(name: "Eric Dean", specialty: "Marine Biology", university: "CSULB")
    scientist_2 = lab.scientists.create!(name: "Ethan Cohen", specialty: "Rocks", university: "Cambridge")
    experiment_1 = Experiment.create!(name: "Fish", objective: "Look at fish", num_months: 22, scientists: [scientist])
    experiment_2 = Experiment.create!(name: "Danger", objective: "Mix dangerous chemicals", num_months: 5, scientists: [scientist])

    visit "/scientists/#{scientist.id}"

    expect(page).to have_button("Remove #{experiment_1.name}")
    expect(page).to have_button("Remove #{experiment_2.name}")

  end

  it "can remove an experiment from a scientist" do
    lab = Lab.create!(name: "Weesh Industries")
    scientist = lab.scientists.create!(name: "Eric Dean", specialty: "Marine Biology", university: "CSULB")
    scientist_2 = lab.scientists.create!(name: "Ethan Cohen", specialty: "Rocks", university: "Cambridge")
    experiment_1 = Experiment.create!(name: "Fish", objective: "Look at fish", num_months: 22, scientists: [scientist, scientist_2])
    experiment_2 = Experiment.create!(name: "Danger", objective: "Mix dangerous chemicals", num_months: 5, scientists: [scientist, scientist_2])

    visit "/scientists/#{scientist.id}"

    click_button("Remove #{experiment_1.name}")


    expect(page).not_to have_content(experiment_1.name)
    expect(page).to have_content(experiment_2.name)

    visit "/scientists/#{scientist_2.id}"


    expect(page).to have_content(experiment_1.name)
    expect(page).to have_content(experiment_2.name)
  end


end

  