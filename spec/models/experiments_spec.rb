require 'rails_helper' 

RSpec.describe Experiment, type: :model do 
  describe "relationships" do 
    it { should have_many :scientist_experiments}
    it { should have_many(:scientists).through(:scientist_experiments) }
  end

  describe "#sort_by_length" do 
    it "can sort by length of experiment - num_months" do 
      @exp_1 = Experiment.create!(name: "MINERvA", objective: "study neutrino reactions with 5 different nuclei", num_months: 4)
      @exp_2 = Experiment.create!(name: "Freedom 7", objective: "trajectory analysis", num_months: 10)

      @exp_3 = Experiment.create!(name: "EXP 3", objective: "a very scientific description", num_months: 12)
      @exp_4 = Experiment.create!(name: "EXP 4", objective: "SCIENCE", num_months: 9)

      expect(Experiment.long_running(6)).to eq([@exp_3, @exp_2, @exp_4])
      expect(Experiment.long_running(3)).to eq([@exp_3, @exp_2, @exp_4, @exp_1])
    end
  end
end