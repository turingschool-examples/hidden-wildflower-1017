require 'rails_helper'

RSpec.describe Experiment do
  it {should have_many :scientist_experiments}
  it {should have_many(:scientists).through(:scientist_experiments)}

  describe '.long_running' do
    it 'returns experiments longer than 6 months in descending order' do

      experiment1 = Experiment.create(name: 'SCP 900', num_months: 7)
      experiment2 = Experiment.create(name: 'SCP 205', num_months: 9)
      experiment3 = Experiment.create(name: 'SCP 100', num_months: 3)
      experiment4 = Experiment.create(name: 'SCP 999', num_months: 1)

      long_running_experiments = Experiment.long_running

      expect(long_running_experiments).to eq([experiment2, experiment1])
    end
  end
end