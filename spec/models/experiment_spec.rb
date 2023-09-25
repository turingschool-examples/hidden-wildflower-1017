require 'rails_helper'

RSpec.describe Experiment, type: :model do
  describe "relationships" do
    it { should have_many :scientists}
  end
end
