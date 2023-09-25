class Experiment < ApplicationRecord
  has_many :scientists_experiments
  has_many :scientists, through: :scientists_experiments

  def self.experiment_length
    where('num_months > ?', 6)
    .order(num_months: :desc)
  end
end