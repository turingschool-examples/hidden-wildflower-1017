require "rails_helper"

RSpec.describe "Scientist Show", type: :feature do
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
      it "displays all of that scientists information, including name, specialty, and university where they got their degree, and I see the name of the lab where this scientist works and I see the names of all of the experiments this scientist is running" do
        visit "/scientists/#{@marie.id}"

        expect(page).to have_content("#{@marie.name}")
        expect(page).to have_content("Specialty: #{@marie.specialty}")
        expect(page).to have_content("University attended: #{@marie.university}")
        expect(page).to have_content("Lab where #{@marie.name} works: #{@marie.lab.name}")
        expect(page).to have_content("Experiments #{@marie.name} is running:")
        expect(page).to have_content("#{@marie.experiments[0].name}")
        expect(page).to have_content("#{@marie.experiments[1].name}")
      end
    end
  end
end