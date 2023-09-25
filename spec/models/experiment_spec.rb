require 'rails_helper'

RSpec.describe Experiment do
  it {should have_many :experiment_scientists}
  it {should have_many(:scientists).through(:experiment_scientists)}

  describe "#long_term_experiments" do
    it "grabs only experiments of length > 6 and orders by longest length first" do
      @exp1 = Experiment.create!(name: "The Goo", objective: "Understand the goo", num_months: 10)
      @exp2 = Experiment.create!(name: "Study Gonzo", objective: "Is Alien?", num_months: 1)
      @exp3 = Experiment.create!(name: "Make Rocket", objective: "Strap Gonzo to Rocket", num_months: 8)

      expect(Experiment.long_term_experiments).to eq([@exp1, @exp3])
    end
  end
end