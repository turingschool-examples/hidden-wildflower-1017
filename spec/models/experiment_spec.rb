require 'rails_helper'

RSpec.describe Experiment, type: :model do
  before :each do
    @lab = Lab.create!(name: "Hinkey Lab")

    @scientist_1 = @lab.scientists.create!(name: "Darnell", specialty: "Cell Research", university: "USC")
    @experiment_1 = Experiment.create!(name: "Cell Division #1", objective: "To improve cell research", num_months: 4)
    @experiment_2 = Experiment.create!(name: "Stem Division #2", objective: "To improve stem research", num_months: 48)
    @experiment_3 = Experiment.create!(name: "Bone Division #3", objective: "To improve bone research", num_months: 10)

    @scientist_1_experiment_1 = @scientist_1.scientist_experiments.create!(scientist: @scientist_1, experiment: @experiment_1)
    @scientist_1_experiment_2 = @scientist_1.scientist_experiments.create!(scientist: @scientist_1, experiment: @experiment_2)
    @scientist_1_experiment_3 = @scientist_1.scientist_experiments.create!(scientist: @scientist_1, experiment: @experiment_3)
  end

  describe "relationships" do
    it { should have_many(:scientist_experiments)}
    it { should have_many(:scientists).through(:scientist_experiments)}
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :objective }
    it { should validate_presence_of :num_months }
  end

  it "can order the experiments in descending order with 6 month requirement" do
    expect(Experiment.long_experiments).to eq([@experiment_2, @experiment_3])
  end
end