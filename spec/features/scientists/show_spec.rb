require "rails_helper"

RSpec.describe "scientist#show" do
  before :each do
    @lab_1 = Lab.create!(name: "Dexter's Lab")

    @scientist_1 = @lab_1.scientists.create!(name: "Marie Curie", specialty: "radioactivity", university: "University of Paris")
    @scientist_2 = @lab_1.scientists.create!(name: "Dexter McPherson", specialty: "gamma wave", university: "Genius Grove University")

    @experiment_1 = Experiment.create!(name: "MINERvA", objective: "study neutrino reactions with five different nuclei", num_months: 4)
    @experiment_2 = Experiment.create!(name: "BeardTech", objective: "study beard growth in little boys with german accents", num_months: 6)

    @marie_exp_1 = @scientist_1.scientist_experiments.create!(scientist_id: @scientist_1.id, experiment_id: @experiment_1)
    @marie_exp_2 = @scientist_1.scientist_experiments.create!(scientist_id: @scientist_1.id, experiment_id: @experiment_2)

    @dexter_exp_1 = @scientist_2.scientist_experiments.create!(scientist_id: @scientist_2.id, experiment_id: @experiment_1)
    @dexter_exp_2 = @scientist_2.scientist_experiments.create!(scientist_id: @scientist_2.id, experiment_id: @experiment_2)
  end

  describe "details" do
    it "see all of that scientist's information including:name, specialty, university where they got their degree" do
      visit "/scientists/#{@scientist_1.id}"

      expect(page).to have_content(@scientist_1.name)
      expect(page).to have_content(@scientist_1.specialty)
      expect(page).to have_content(@scientist_1.university)

    end

    it "shows the name of the lab where this scientist works and the names of all of the experiments this scientist is running" do
      visit "/scientists/#{@scientist_1.id}"

      expect(page).to have_content(@lab.name)
      expect(page).to have_content(@experiment_1.name)
      expect(page).to have_content(@experiment_2.name)

    end
  end

end