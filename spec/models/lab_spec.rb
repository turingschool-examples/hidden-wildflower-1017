require 'rails_helper'

RSpec.describe Lab do
  it {should have_many :scientists}

  describe "instance methods" do
    before(:each) do
      @lab_1 = Lab.create!(name: "The Testing Locale")
      @lab_2 = Lab.create!(name: "The Fake Lab")
      @scientist_1 = Scientist.create!(name: "Chicken", specialty: "Being afraid", university: "Kiwi's Bird School", lab_id: @lab_1.id)
      @scientist_2 = Scientist.create!(name: "Coco", specialty: "Low brain power", university: "Kiwi's Bird School", lab_id: @lab_1.id)
      @scientist_3 = Scientist.create!(name: "Hiccup", specialty: "Poor flight control", university: "Kiwi's Bird School", lab_id: @lab_1.id)
      @scientist_4 = Scientist.create!(name: "Kila", specialty: "Not even a bird", university: "None", lab_id: @lab_2.id)
      @scientist_5 = Scientist.create!(name: "Kiwi", specialty: "Preinstalled BirdOS", university: "Founder World", lab_id: @lab_2.id)
      @experiment_1 = Experiment.create!(name: "BrainP", objective: "Determine if we have brains at all", num_months: 17)
      @experiment_2 = Experiment.create!(name: "FlAP", objective: "(Fl)y (A)ll over the (P)lace", num_months: 3)
      @experiment_3 = Experiment.create!(name: "EATM", objective: "EAT ALL THE MILLET", num_months: 50)
      ScientistExperiment.create!(scientist_id: @scientist_1.id, experiment_id: @experiment_2.id)
      ScientistExperiment.create!(scientist_id: @scientist_1.id, experiment_id: @experiment_3.id)
      ScientistExperiment.create!(scientist_id: @scientist_2.id, experiment_id: @experiment_1.id)
      ScientistExperiment.create!(scientist_id: @scientist_2.id, experiment_id: @experiment_2.id)
      ScientistExperiment.create!(scientist_id: @scientist_2.id, experiment_id: @experiment_3.id)
      ScientistExperiment.create!(scientist_id: @scientist_3.id, experiment_id: @experiment_3.id)
      ScientistExperiment.create!(scientist_id: @scientist_5.id, experiment_id: @experiment_3.id)
    end

    describe "#scientists_by_experiment_count" do
      it "returns a list of scientists for a given lab, sorted by number of experiments they're associated with" do
        expect(@lab_1.scientists_by_experiment_count).to eq([@scientist_2, @scientist_1, @scientist_3])
      end

      it "handles scientists who have no current experiments" do
        scientists = @lab_2.scientists_by_experiment_count

        expect(scientists).to eq([@scientist_5, @scientist_4])
        expect(scientists.last.experiment_count).to eq(0)
      end
    end
  end
end