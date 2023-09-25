require 'rails_helper'

RSpec.describe Scientist do
  describe "validations" do
    it { validate_presence_of :name }
    it { validate_numericality_of :specialty}
    it { validate_presence_of :university }
  end

  it {should belong_to :lab}
  it {should have_many :scientist_experiments}
  it { should have_many(:experiments).through(:scientist_experiments) }
end