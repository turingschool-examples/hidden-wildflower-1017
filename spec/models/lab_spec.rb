require 'rails_helper'

RSpec.describe Lab do
  it {should have_many :scientists}

  describe "#scientists_with_exp_count" do
    it "returns list of scientist names with their experiment count
    ordered by highest number of experiments first" do
      @muppet_labs = Lab.create!(name: "Muppet Labs")
      @beaker = @muppet_labs.scientists.create!(name: "Beaker", specialty: "Muppetry", university: "Muppet U")
      @bunsen = @muppet_labs.scientists.create!(name: "Dr. Bunsen Honeydew", specialty: "Muppetry", university: "Muppet U")
      @exp1 = Experiment.create!(name: "The Goo", objective: "Understand the goo", num_months: 10)
      @exp2 = Experiment.create!(name: "Study Gonzo", objective: "Is Alien?", num_months: 1)
      @exp3 = Experiment.create!(name: "Make Rocket", objective: "Strap Gonzo to Rocket", num_months: 8)
      ExperimentScientist.create!(scientist: @beaker, experiment: @exp1)
      ExperimentScientist.create!(scientist: @bunsen, experiment: @exp1)
      ExperimentScientist.create!(scientist: @bunsen, experiment: @exp2)
      ExperimentScientist.create!(scientist: @bunsen, experiment: @exp3)


      expect(@muppet_labs.scientists_with_exp_count.first.name).to eq("Dr. Bunsen Honeydew")
      expect(@muppet_labs.scientists_with_exp_count.first.exp_count).to eq(3)
      expect(@muppet_labs.scientists_with_exp_count.second.name).to eq("Beaker")
      expect(@muppet_labs.scientists_with_exp_count.second.exp_count).to eq(1)
    end
  end
end