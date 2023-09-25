class Experiment < ApplicationRecord
  has_many :scientists_experiments
  has_many :scientists, through: :scientists_experiments
end