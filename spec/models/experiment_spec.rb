require 'rails_helper'

RSpec.describe Experiment, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:objective) }
    it { should validate_presence_of(:num_months) }
  end
  
  describe "relationships" do
    it { should have_many(:scientist_experiments) }
    it { should have_many(:scientists).through(:scientist_experiments)}
  end
end
