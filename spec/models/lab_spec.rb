require 'rails_helper'

RSpec.describe Lab do
  describe "realtionships" do
    it { should have_many :scientists }
  end
end