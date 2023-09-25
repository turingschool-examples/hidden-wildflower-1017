require 'rails_helper'

RSpec.describe Experiement do
  it { should have_many(:scientists).through(:science_experiements) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :objective }
  it { should validate_presence_of :num_months }
end