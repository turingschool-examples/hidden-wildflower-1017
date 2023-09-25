class Scientist < ApplicationRecord
  belongs_to :lab

  has_many :experiements, through :science_experiements
end