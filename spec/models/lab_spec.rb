require 'rails_helper'

RSpec.describe Lab do
  before :each do
    load_test_data
  end

  it {should have_many :scientists}

  describe "instance methods" do
    describe "#scientists_by_experiments" do
      it "can return scientists ordered by experiments" do
        expect(@fermilab.scientists_by_experiments).to eq([@curie, @feynman])
      end
    end 
  end
end