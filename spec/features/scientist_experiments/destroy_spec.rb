require "rails_helper"

RSpec.describe "ScientistExperiment Destroy", type: :feature do
  before :each do
    @fermilab = Lab.create!(name: "Fermilab")
    @marie = @fermilab.scientists.create!(name: "Marie Curie", specialty: "Radioactivity", university: "University of Paris")
    @einstein = @fermilab.scientists.create!(name: "Albert Einstein", specialty: "Theoretical Physics", university: "University of Zurich")
    @gene_splicing = Experiment.create!(name: "Gene Splicing", objective: "Splice the genes", num_months: 152)
    @nuclear_fusion = Experiment.create!(name: "Nuclear Fusion", objective: "Fuse the nuclears", num_months: 303)
    ScientistExperiment.create!(scientist: @marie, experiment: @gene_splicing)
    ScientistExperiment.create!(scientist: @marie, experiment: @nuclear_fusion)
    ScientistExperiment.create!(scientist: @einstein, experiment: @gene_splicing)
    ScientistExperiment.create!(scientist: @einstein, experiment: @nuclear_fusion)
  end
  
  describe "As a visitor" do
    describe "When I visit a scientists show page" do
      it "displays buttons to remove each experiment from that scientists workload next to each experiments name" do
        visit "/scientists/#{@marie.id}"
        
        expect(page).to have_button("Remove experiment #{@marie.experiments.first.id}")
        expect(page).to have_button("Remove experiment #{@marie.experiments.last.id}")
      end

      describe "When I click that button for one experiment" do
        it "brings me back to the scientists show page and I no longer see that experiments name listed. When I visit a different scientists show page that is working on that same experiment, it still displays that experiment on the other scientists workload" do
          visit "/scientists/#{@marie.id}"

          click_on "Remove experiment #{@marie.experiments.first.id}"

          expect(current_path).to eq("/scientists/#{@marie.id}")

          expect(page).to_not have_content("#{@gene_splicing.name}")
          expect(page).to have_content("#{@nuclear_fusion.name}")

          visit "/scientists/#{@einstein.id}"

          expect(page).to have_content("#{@gene_splicing.name}")
          expect(page).to have_content("#{@nuclear_fusion.name}")
        end
      end
    end
  end
end
