require 'rails_helper'

RSpec.describe Scientist do
  it {should belong_to :lab}
  it {should have_many :scientist_experiments}
  it {should have_many(:experiments).through(:scientist_experiments)}

  describe "instance methods" do
    it "#lab_name" do
      lab = Lab.create!(name: "Laboratory")
      scientist = Scientist.create!(name: "Scientist1", specialty: "Science", university: "GoodU", lab_id: lab.id)
      
      expect(scientist.lab_name).to eq(lab.name)
    end
  end
end