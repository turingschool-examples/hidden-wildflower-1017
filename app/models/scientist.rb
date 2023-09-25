class Scientist < ApplicationRecord
  belongs_to :lab
  has_many :scientist_experiments
  has_many :experiments, through: :scientist_experiments

  def self.scientist_experiment_counts
    Scientist.joins(:experiments).select("scientists.name, count(scientist_experiments) as experiment_count").group("scientists.name").order("experiment_count DESC")
  end
end