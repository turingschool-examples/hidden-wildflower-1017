require "rails_helper"

RSpec.describe "Lab Show", type: :feature do
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
    ScientistExperiment.create!(scientist: @einstein, experiment: @anti_gravity)
  end

  describe "As a visitor" do
    describe "When I visit a labs show page" do
      it "displays the labs name and I see the names of all scientists that work at this lab, and next to each scientist I see the number of experiments associated with the scientist, and I see the list of scientists is ordered from most number of experiments to least number of experiments" do
        visit "/labs/#{@fermilab.id}"

        expect(page).to have_content("#{@fermilab.name}")
        expect(page).to have_content("Scientists that work here:")
        expect(page).to have_content("#{@marie.name}, Experiments: 2")
        expect(page).to have_content("#{@einstein.name}, Experiments: 3")
        expect(@einstein.name).to appear_before(@marie.name)
      end
    end
  end
end