require 'rails_helper'

RSpec.describe Experiment, type: :model do
  describe "relationships" do
    it { should have_many :scientist_experiments }
    it { should have_many(:scientists).through(:scientist_experiments) }
  end

  describe "class methods" do
    before(:each) do
      @experiment_1 = Experiment.create!(name: "BrainP", objective: "Determine if we have brains at all", num_months: 17)
      @experiment_2 = Experiment.create!(name: "FlAP", objective: "(Fl)y (A)ll over the (P)lace", num_months: 3)
      @experiment_3 = Experiment.create!(name: "EATM", objective: "EAT ALL THE MILLET", num_months: 50)
    end

    describe "#long_experiments" do
      it "returns all experiments running longer than 6 months, sorted by duration descending" do
        expect(Experiment.long_experiments).to eq([@experiment_3, @experiment_1])
      end
    end
  end
end