require 'rails_helper'

RSpec.describe Lab, type: :model do
  describe "relationships" do
    it { should have_many :scientists }
  end
end