class Lab < ApplicationRecord
  has_many :scientists
  # has_many :scientist_experiments, through: :scientist
  # has_many :experiments, through: :scientist_experiments
end