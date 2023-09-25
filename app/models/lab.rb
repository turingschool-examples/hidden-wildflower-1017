class Lab < ApplicationRecord
  has_many :scientists

  has_many :experiements, through :scientists

  validates_presence_of :
end