require 'rails_helper'

RSpec.describe ExperimentScientist do
  it {should belong_to :scientist}
  it {should belong_to :experiment}

  describe "#assigned_exp_scientist" do
    it "finds the ExperimentScientist entry associated with
    given scientist id and experiment id" do
      @muppet_labs = Lab.create!(name: "Muppet Labs")
      @exp1 = Experiment.create!(name: "The Goo", objective: "Understand the goo", num_months: 10)
      @exp2 = Experiment.create!(name: "Study Gonzo", objective: "Is Alien?", num_months: 1)
      @beaker = @muppet_labs.scientists.create!(name: "Beaker", specialty: "Muppetry", university: "Muppet U")
      @exp_sci1 = ExperimentScientist.create!(scientist: @beaker, experiment: @exp1)
      @exp_sci2 = ExperimentScientist.create!(scientist: @beaker, experiment: @exp2)
  
      expect(ExperimentScientist.assigned_exp_scientist(@beaker.id, @exp1.id)).to eq(@exp_sci1)
      expect(ExperimentScientist.assigned_exp_scientist(@beaker.id, @exp2.id)).to eq(@exp_sci2)

    end
  end
end