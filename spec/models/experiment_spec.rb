require 'rails_helper'

RSpec.describe Experiment, type: :model do
  describe "relationships" do
    it { should have_many :scientist_experiments }
    it { should have_many(:scientists).through(:scientist_experiments) }
  end

  before :each do
    @nuclear_fusion = Experiment.create!(name: "Nuclear Fusion", objective: "Fuse the nuclears", num_months: 303)
    @gene_splicing = Experiment.create!(name: "Gene Splicing", objective: "Splice the genes", num_months: 152)
    @anti_gravity = Experiment.create!(name: "Anti-Gravity", objective: "Defy gravity", num_months: 2)
  end

  describe "long_running_experiments" do
    it "returns the experiments that have been running for longer than 6 months ordered from longest to shortest run times" do
      query = Experiment.long_running_experiments

      expect(query).to eq([@nuclear_fusion, @gene_splicing])
    end
  end
end