require 'rails_helper'

RSpec.describe Experiment do
  describe "relationships" do
    it {should have_many :experiment_scientists}
    it {should have_many(:scientists).through(:experiment_scientists)}
  end

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :objective}
    it {should validate_presence_of :num_months}
  end
end