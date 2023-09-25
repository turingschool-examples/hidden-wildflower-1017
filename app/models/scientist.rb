class Scientist < ApplicationRecord
  belongs_to :lab
  has many :scientist_experiments
  has many :experiments, through: :scientist_experiments
end