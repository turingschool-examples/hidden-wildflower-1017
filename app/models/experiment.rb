class Experiment < ApplicationRecord
  has_many :scientist_experiments
  has_many :scientists, through: :scientist_experiments
  
  def self.sort_by_num_months_longer_than_six
    Experiment.order(num_months: :desc).where("num_months > 6")
  end
end