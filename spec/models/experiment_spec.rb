require 'rails_helper'

RSpec.describe Experiment do
  before :each do
    load_test_data
  end

  describe "class methods" do
    describe ".long_experimnets" do
      it "can return long experiments ordered by length" do
        expect(Experiment.long_experiments).to eq([@voyager, @manhattan])
      end
    end 
  end
end