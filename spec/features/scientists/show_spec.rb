require "rails_helper" 

RSpec.describe "Merchant's Item's Show Page" do 
  before(:each) do 
    @lab1 = Lab.create!(name: "Bob's lab")
    @scientist1 = @lab1.scientists.create!(name:"Bob", specialty:"Makin stuff", university:"Oxford")
    @experiment1 = Experiment.create!(name: "Timmy", objective:"To grow", num_months: 10)
    @experiment2 = Experiment.create!(name: "Doggo", objective:"To find snacks", num_months: 2)
    @experiment3 = Experiment.create!(name: "Draco", objective:"Become a wizard", num_months: 60)
    @scientist_experiment1 = ScientistExperiment.create!(scientist:@scientist1, experiment:@experiment1)
    @scientist_experiment2 = ScientistExperiment.create!(scientist:@scientist1, experiment:@experiment2)
    @scientist_experiment3 = ScientistExperiment.create!(scientist:@scientist1, experiment:@experiment3)
  end
  it "scientist show page" do
    visit "/scientists/#{@scientist1.id}"

    expect(page).to have_content(@scientist1.name)
    expect(page).to have_content(@scientist1.specialty)
    expect(page).to have_content(@scientist1.university)
    expect(page).to have_content(@lab1.name)
    expect(page).to have_content(@experiment1.name)
    expect(page).to have_content(@experiment2.name)
    expect(page).to have_content(@experiment3.name)
  end
end