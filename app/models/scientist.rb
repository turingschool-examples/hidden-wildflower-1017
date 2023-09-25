class Scientist < ApplicationRecord
  belongs_to :lab
  has_many :scientists_experiments
  has_many :experiments, through: :scientists_experiments
end