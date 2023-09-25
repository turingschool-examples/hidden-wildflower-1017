require 'rails_helper'

RSpec.describe Scientist do
  it { should belong_to :lab }
  it { should have_many(:experiements).through(:science_experiements) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :specialty }
  it { should validate_presence_of :university }
end