require 'rails_helper'

RSpec.describe Lab do
  describe "validations" do
    it { validate_presence_of :name }
  end
  
  it {should have_many :scientists}
end