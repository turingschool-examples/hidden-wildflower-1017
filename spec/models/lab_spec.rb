require 'rails_helper'

RSpec.describe Lab do
  it {should have_many :scientists}

  describe 'instance methods' do
    describe '#scientists_ordered_by_experiment_count' do
      it 'returns scientists ordered by experiment count' do
        lab1 = Lab.create!(name: "Los Alamos National Laboratory")
        scientist1 = lab1.scientists.create!(name: "Robert Oppenheimer", specialty: "Physics", university: "University of Chicago")
        scientist2 = lab1.scientists.create!(name: "Enrico Fermi", specialty: "Physics", university: "University of Paris")
        experiment1 = Experiment.create!(name: "Manhattan Project", objective: "Develop the first nuclear weapons", num_months: 36)
        experiment2 = Experiment.create!(name: "Trinity", objective: "Test the first nuclear weapons", num_months: 5)
        scientist1.experiments << experiment1
        scientist1.experiments << experiment2
        scientist2.experiments << experiment1

        expect(lab1.scientists_ordered_by_experiment_count).to eq([scientist1, scientist2])
      end
    end
  end
end