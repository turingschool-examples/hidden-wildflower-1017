class Experiment < ApplicationRecord
  has_many :scientist_experiments
  has_many :scientists, through: :scientist_experiments

  validates_presence_of :name
  validates_presence_of :objective
  validates_presence_of :num_months

  def self.long_experiments
    where('num_months > ?', 6).order(num_months: :desc)
  end
end