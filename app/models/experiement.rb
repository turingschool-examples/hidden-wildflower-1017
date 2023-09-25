class Experiement < ApplicationRecord
  has_many :science_experiements

  
  has_many :scientists, through: :science_experiements

  validates_presence_of :name
  validates_presence_of :objective 
  validates_presence_of :num_months 
end