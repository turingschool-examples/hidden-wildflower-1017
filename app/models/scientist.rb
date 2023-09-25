class Scientist < ApplicationRecord
  belongs_to :lab
  has_many :scientist_experiments
  has_many :experiments, through: :scientist_experiments

  validates_presence_of :name
  validates_presence_of :specialty
  validates_presence_of :university
end