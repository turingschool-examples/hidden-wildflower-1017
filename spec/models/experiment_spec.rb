require 'rails_helper'

RSpec.describe Experiment do
  it {should have_many :scientists}

  describe "class methods" do
    describe "::experiment_length" do
      it "returns experiments with length greater than 6 months" do
        experiment_1 = Experiment.create!(name: "Actinium", num_months: 12)
        experiment_2 = Experiment.create!(name: "Niobium", num_months: 11)
        experiment_3 = Experiment.create!(name: "Promethium", num_months: 8)
        experiment_4 = Experiment.create!(name: "Argon", num_months: 7)
        experiment_5 = Experiment.create!(name: "Radon", num_months: 4)
        experiment_6 = Experiment.create!(name: "Silicon", num_months: 3)

        expect(Experiment.experiment_length).to eq([experiment_1, experiment_2, experiment_3, experiment_4])
      end
    end
  end
end