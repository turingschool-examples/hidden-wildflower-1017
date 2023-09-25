require 'rails_helper'

RSpec.describe ExperimentScientist do
  it { should belong_to :scientists }
  it { should belong_to :experiment }
end