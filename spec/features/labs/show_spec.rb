require "rails_helper" 

RSpec.describe "Labs Show Page" do 
  before(:each) do 
    @lab1 = Lab.create!(name: "Bob's lab")
    @scientist1 = @lab1.scientists.create!(name:"Bob", specialty:"Makin stuff", university:"Oxford")
    @scientist2 = @lab1.scientists.create!(name:"Joe", specialty:"Makin stuff", university:"Cambridge")
    @scientist3 = @lab1.scientists.create!(name:"Jimmy", specialty:"Makin stuff", university:"A barn")
    @experiment1 = Experiment.create!(name: "Timmy", objective:"To grow", num_months: 10)
    @experiment2 = Experiment.create!(name: "Doggo", objective:"To find snacks", num_months: 2)
    @experiment3 = Experiment.create!(name: "Draco", objective:"Become a wizard", num_months: 60)
    @scientist_experiment1 = ScientistExperiment.create!(scientist:@scientist1, experiment:@experiment1)
    @scientist_experiment2 = ScientistExperiment.create!(scientist:@scientist2, experiment:@experiment2)
    @scientist_experiment3 = ScientistExperiment.create!(scientist:@scientist2, experiment:@experiment3)
    @scientist_experiment4 = ScientistExperiment.create!(scientist:@scientist3, experiment:@experiment1)
    @scientist_experiment5 = ScientistExperiment.create!(scientist:@scientist3, experiment:@experiment2)
    @scientist_experiment6 = ScientistExperiment.create!(scientist:@scientist3, experiment:@experiment3)
  end

  it "Visit lab show page with details" do
    visit "labs/#{@lab1.id}"

    expect(page).to have_content(@lab1.name)
    expect(page).to have_content("#{@scientist1.name} has 1 experiments")
    expect(page).to have_content("#{@scientist2.name} has 2 experiments")
    expect(page).to have_content("#{@scientist3.name} has 3 experiments")

  end
end