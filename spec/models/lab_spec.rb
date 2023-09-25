require 'rails_helper'

RSpec.describe Lab do
  it {should have_many :scientists}
  it {should have_many(:scientist_experiments).through(:scientists)}
  it {should have_many(:experiments).through(:scientist_experiments)}
end