class Scientist < ApplicationRecord
  belongs_to :lab
  
  has_many :science_experiements

  has_many :experiements, through: :science_experiements

  validates_presence_of :name
  validates_presence_of :specialty
  validates_presence_of :university
end