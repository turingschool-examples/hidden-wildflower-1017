class Experiment < ApplicationRecord
  has_many :scientist_experiments
  has_many :scientists, through: :scientist_experiments

  def self.long_running(months)
    where("num_months > ?", months).order(num_months: :desc)
  end
end