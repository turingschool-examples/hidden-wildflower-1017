class Scientist < ApplicationRecord
  belongs_to :lab
  has_many :scientist_experiments
  has_many :experiments, through: :scientist_experiments

  # def self.experiment_count
  #   scientist_experiments
  #   .select('scientist_experiments.id, count(scientist_experiments.id) as experiment_count')
  #   .group('scientist_experiments.id').order('experiment_count desc')
  # end
end