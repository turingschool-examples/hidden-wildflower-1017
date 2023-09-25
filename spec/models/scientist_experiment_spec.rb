require "rails_helper"

RSpec.describe ScientistExperiment, type: :model do
  describe "relationships" do
    it { should belong_to(:experiment) }
    it { should belong_to(:scientist) }

  end
end