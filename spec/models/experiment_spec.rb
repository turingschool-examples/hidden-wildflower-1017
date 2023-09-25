require 'rails_helper'

RSpec.describe Experiment, type: :model do
  describe "validations" do
    it { validate_presence_of :name }
    it { validate_numericality_of :objective }
    it { validate_presence_of :num_months }
  end
  it {should have_many :scientist_experiments}
  it { should have_many(:scientists).through(:scientist_experiments) }

  before(:each) do
    @experiment_1 = Experiment.create!(name: "MINERvA", objective: "study neutrino reactions with five different nuclei", num_months: 4)
    @experiment_2 = Experiment.create!(name: "BeardTech", objective: "study beard growth in little boys with german accents", num_months: 6)
    @experiment_3 = Experiment.create!(name: "LongBoi", objective: "study how long it takes for Cory to learn coding", num_months: 8)
  end
  
  describe "#long" do
    it "shows the experiments over 6 months long in descending order" do
      expect(Experiment.long).to eq([@experiment_3, @experiment_2])

    end
  end
end
