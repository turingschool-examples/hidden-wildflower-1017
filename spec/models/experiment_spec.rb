require 'rails_helper'

RSpec.describe Experiment, type: :model do
  describe "validations" do
    it { validate_presence_of :name }
    it { validate_numericality_of :objective }
    it { validate_presence_of :num_months }
  end
  it {should have_many :scientist_experiments}
  it { should have_many(:scientists).through(:scientist_experiments) }
end
