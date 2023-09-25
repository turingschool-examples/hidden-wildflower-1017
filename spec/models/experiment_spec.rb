require 'rails_helper'

RSpec.describe Experiment, type: :model do
  describe "relationships" do
    it {should have_many :scientist_experiments}
    it {should have_many(:scientists).through(:scientist_experiments)}
  end

  before :each do
    @experiment_1 = Experiment.create!(name: "Divergence", objective: "Study Time", num_months: 18)
    @experiment_2 = Experiment.create!(name: "Universe", objective: "How big is it?", num_months: 36)
    @experiment_3 = Experiment.create!(name: "Evolution", objective: "Find Ancestors", num_months: 9)
    @experiment_4 = Experiment.create!(name: "X-Ray", objective: "See peoples bones", num_months: 4)
  end

  describe "class methods" do
    describe "long_running_experiments" do
      it "returns the experiements that have been running longer than 6 months and orders them in descending order" do
        expect(Experiment.long_running_experiments).to eq([@experiment_2, @experiment_1, @experiment_3])
      end
    end
  end
end
