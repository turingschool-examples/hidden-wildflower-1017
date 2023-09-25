class Experiment < ApplicationRecord
  has_many :scientist_experiments
  has_many :scientists, through: :scientist_experiments

  validates_presence_of :name, :objective, :num_months

  def self.long_running
    where('num_months > ?', 6).order(num_months: :desc)
  end
end
