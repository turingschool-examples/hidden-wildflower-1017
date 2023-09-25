require 'rails_helper'

RSpec.describe ScienceExperiement do
  it {should belong_to :experiement}
  it {should belong_to :scientist}  
end