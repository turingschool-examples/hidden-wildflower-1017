class Experiement < ApplicationRecord
  has_many :scientists, through :science_experiements
end