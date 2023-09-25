class Scientist < ApplicationRecord
  belongs_to :lab
  has_many :experiment_scientists
  has_many :experiment, through: :experiment_scientists
end