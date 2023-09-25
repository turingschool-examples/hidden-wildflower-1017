require 'rails_helper'

RSpec.describe Scientist do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:university) }
    it { should validate_presence_of(:lab) }
  end
  
  describe "relationships" do
    it {should belong_to :lab}
    it { should have_many(:scientist_experiments) }
    it { should have_many(:experiments).through(:scientist_experiments)}
  end
end