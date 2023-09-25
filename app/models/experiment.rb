class Experiment < ApplicationRecord
  validates_presence_of :name, :objective, :num_months

  has_many :experiment_scientists
  has_many :scientists, through: :experiment_scientists
end