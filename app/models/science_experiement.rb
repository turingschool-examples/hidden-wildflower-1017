class ScienceExperiement < ApplicationRecord
  belongs_to :scientist
  belongs_to :experiement 
end