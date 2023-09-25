class Experiment < ApplicationRecord
  has_many :experiment_scientists
  has_many :scientists, through: :experiment_scientists

  def self.longer_than(months)
    where("num_months > ?", months).order("num_months DESC")
  end
end