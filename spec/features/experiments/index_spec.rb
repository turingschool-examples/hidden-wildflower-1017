require "rails_helper"

RSpec.describe "Experiments Index", type: :feature do
  before :each do
    @fermilab = Lab.create!(name: "Fermilab")
    @marie = @fermilab.scientists.create!(name: "Marie Curie", specialty: "Radioactivity", university: "University of Paris")
    @einstein = @fermilab.scientists.create!(name: "Albert Einstein", specialty: "Theoretical Physics", university: "University of Zurich")
    @gene_splicing = Experiment.create!(name: "Gene Splicing", objective: "Splice the genes", num_months: 152)
    @nuclear_fusion = Experiment.create!(name: "Nuclear Fusion", objective: "Fuse the nuclears", num_months: 303)
    @anti_gravity = Experiment.create!(name: "Anti-Gravity", objective: "Defy gravity", num_months: 2)
    ScientistExperiment.create!(scientist: @marie, experiment: @gene_splicing)
    ScientistExperiment.create!(scientist: @marie, experiment: @nuclear_fusion)
    ScientistExperiment.create!(scientist: @einstein, experiment: @gene_splicing)
    ScientistExperiment.create!(scientist: @einstein, experiment: @nuclear_fusion)
  end

  describe "As a visitor" do
    describe "When I visit the experiment index page" do
      it "displays the names of all long running experiments (longer than 6 months) and I see the names are in descending order (longest to shortest)" do
        visit "/experiments"

        expect(page).to have_content("Long Running Experiments:")
        expect(page).to have_content("#{@gene_splicing.name}")
        expect(page).to have_content("#{@nuclear_fusion.name}")
        expect(page).to_not have_content("#{@anti_gravity.name}")
        
        expect(@nuclear_fusion.name).to appear_before(@gene_splicing.name)
      end
    end
  end
end