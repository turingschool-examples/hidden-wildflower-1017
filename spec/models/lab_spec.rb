require 'rails_helper'

RSpec.describe Lab do
  describe "relationships" do 
    it { should have_many :scientists }
    it { should validate_presence_of :name }
  end 
end