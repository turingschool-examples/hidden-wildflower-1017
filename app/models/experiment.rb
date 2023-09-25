class Experiment < ApplicationRecord
  has_many :scientist_experiments
  has_many :experiments, through: :scientist_experiments
end