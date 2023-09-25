require "rails_helper"

RSpec.describe Experiment, type: :model do
  describe "relationships" do
    it { should have_many :scientist_experiments }
    it { should have_many(:scientists).through(:scientist_experiments) }
  end

  describe ".long_running_descending" do
    it "should return only the experiments running longer than 6 months in descending order" do
      @experiment_1 = Experiment.create(
        name: "MINERvA",
        objective: "study neutrino reactions with five different nuclei",
        num_months: 9
      )
  
      @experiment_2 = Experiment.create(
        name: "Cell Structure under Intense Heat",
        objective: "study the changes in cell structure in extreme heat",
        num_months: 5
      )
  
      @experiment_3 = Experiment.create(
        name: "How silly is too silly",
        objective: "understanding the impact of being silly",
        num_months: 15
      )

      expect(Experiment.long_running_descending).to eq([@experiment_3, @experiment_1])
    end
  end
end