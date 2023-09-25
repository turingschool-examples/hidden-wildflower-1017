require "rails_helper"

RSpec.describe "Scientist show" do
  before :each do
    @lab_1 = Lab.create!(name: "Shibuya Prefecture")

    @scientist_1 = Scientist.create!(name: "Gojo Sautori", specialty: "Infinity", university: "JJK High", lab_id: @lab_1.id)
    @scientist_2 = Scientist.create!(name: "Suguru Geto", specialty: "Cursed Spirit Manipulation", university: "Tokyo JJ High", lab_id: @lab_1.id)

    @experiment_1 = @scientist_1.experiments.create!(name: "Yuji", objective: "To defeat sakuna", num_months: 21)
    @experiment_2 = @scientist_1.experiments.create!(name: "Jogoooo", objective: "To toy with", num_months: 1)
    @experiment_3 = @scientist_2.experiments.create!(name: "Mahito", objective: "to puppet and create chaos", num_months: 210)

    @scientist_2.experiments << @experiment_2
  end

  describe "US 1 - Scientist Show" do
    describe "When I visit a scientists show page" do
      xit "I see the scientists info" do
        visit scientist_path(@scientist_1)

        expect(page).to have_content(@scientist_1.name)
        expect(page).to have_content(@scientist_1.specialty)
        expect(page).to have_content(@scientist_1.university)
        expect(page).to have_content(@lab_1.name)
        expect(page).to have_content(@experiment_1.name)
        expect(page).to have_content(@experiment_2.name)
      end
    end
  end

  describe "US 2 - Remove an Experiment" do
    describe "I see remove buttons next to each experiment on a scientists show page" do
      describe "When I click that button for one experiment I'm brought back to the scientist's show page and I no longer see that experiment's name listed" do
        it "when I visit a different scientist's show page that is working on that same experiment, I see that the experiment is still on the other scientist's work load" do
          visit scientist_path(@scientist_1)

          expect(page).to have_content(@experiment_1.name)
          expect(page).to have_content(@experiment_2.name)

          save_and_open_page

          expect(page).to have_button("Remove Experiment")

          click_button "Remove Experiment Jogoooo"

          expect(current_path).to eq(scientist_path(@scientist_1))

          expect(page).not_to have_content(@experiment_2.name)

          visit scientist_path(@scientist_2)

          expect(page).to have_content(@experiment_2.name)
          expect(page).to have_content(@experiment_3.name)
        end
      end
    end
  end
end
