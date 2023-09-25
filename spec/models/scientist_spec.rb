require 'rails_helper'

RSpec.describe Scientist, type: :model do
  describe "relationships" do
    it { should belong_to :lab }
    it { should have_many :scientist_experiments }
    it { should have_many(:experiments).through(:scientist_experiments) }
  end

  describe "scientist_experiment_counts" do
    it "returns the number of experiments that each scientist is working on and orders the results from most number of experiments to least number of experiments" do
      query = Scientist.scientist_experiment_counts

      expect(query.map { |scientist| scientist.attributes }).to eq([{id: nil, name: "Albert Einstein", experiment_count: 3}, {id: nil, name: "Marie Curie", experiment_count: 2}])
    end
  end
end