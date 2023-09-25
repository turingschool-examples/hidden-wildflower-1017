# require 'rails_helper' 

# RSpec.describe "Lab Show page", type: :feature do
#   before(:each) do
#     @muppet_labs = Lab.create!(name: "Muppet Labs")
#     @beaker = @muppet_labs.scientists.create!(name: "Beaker", specialty: "Muppetry", university: "Muppet U")
#     @bunsen = @muppet_labs.scientists.create!(name: "Dr. Bunsen Honeydew", specialty: "Muppetry", university: "Muppet U")
#     @exp1 = Experiment.create!(name: "The Goo", objective: "Understand the goo", num_months: 10)
#     ExperimentScientist.create!(scientist: @beaker, experiment: @exp1)
#     ExperimentScientist.create!(scientist: @bunsen, experiment: @exp1)
#   end
#   describe "As a visitor" do
#     describe "When I visit /labs/:id" do
#       it "And I see the names of all scientists that work at this lab,
#       And next to each scientist I see the number of experiments associated with the scientist,
#       And I see the list of scientists is ordered from most number of experiments to least number of experiments
#       (Scientist experiment counts should be a single query)" do

#         visit "/labs/#{@muppet_labs.id}"


#       end
#     end
#   end
# end