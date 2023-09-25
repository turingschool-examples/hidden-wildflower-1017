class ScienceExperiement < ApplicationRecord
  has_many :scientists, :experiements 
end