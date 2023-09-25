require 'rails_helper'

RSpec.describe Experiment do
  it {should have_many :scientist_experiments}
  it {should have_many(:scientists).through(:scientist_experiments)}

  describe "methods" do
    before(:each) do
      load_test_data
    end
    it "I see the names of all long running experiments (longer than 6 months),And I see the names are in descending order (longest to shortest)" do
      experiments = Experiment.list_experiments

      expect(experiments.length).to eq(2)

      expect(experiments[0]).to eq(@experiment_3)
      expect(experiments[1]).to eq(@experiment_2)  

    end
  end
end