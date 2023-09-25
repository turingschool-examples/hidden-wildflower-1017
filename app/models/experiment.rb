class Experiment < ApplicationRecord
  has_many :scientist_experiments
  has_many :scientists, through: :scientist_experiments

  def self.list_experiments
    where('num_months > ?', 6).order(num_months: :desc)
  end
end