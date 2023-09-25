require "rails_helper"

RSpec.describe "Scientist" do 
  before :each do 
    @ky = Lab.create!(name: "Kentucky Labs")

    @hill = Scientist.create!(name: "Hill", specialty: "Fertility experiements", university: "USI", lab_id: @ky.id)

    @ollie = Experiement.create!(name: "Ollie Turner", objective: "Cloning", num_months: 7)
    @pepper = Experiement.create!(name: "Pepper Turner", objective: "Cloning", num_months: 7)

    ScienceExperiement.create!(scientist_id: @hill.id, experiement_id: @ollie.id)
    ScienceExperiement.create!(scientist_id: @hill.id, experiement_id: @pepper.id)
  end

  # Show page- US1
  it "shows a scientists details" do 
    visit "/scientists/#{@hill.id}"

    expect(page).to have_content("Scientist Show Page")
    expect(page).to have_content(@hill.name)
    expect(page).to have_content(@hill.specialty)
    expect(page).to have_content(@hill.university)
    expect(page).to have_content(@ky.name)
    expect(page).to have_content(@ollie.name)
    expect(page).to have_content(@pepper.name)
  end

  # Remove button- US2
  it "has a button to, and removes, experiemnts from a scientists show page" do 
    visit "/scientists/#{@hill.id}"

    expect(page).to have_button("Remove #{@ollie.name}")
    expect(page).to have_button("Remove #{@pepper.name}")
  end
end
# save_and_open_page