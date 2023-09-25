class Experiment < ApplicationRecord
  has_many :scientist_experiments
  has_many :scientists, through: :scientist_experiments

  def scientist_experiment(scientist)
    ScientistExperiment.where(scientist_id: scientist.id, experiment_id: id).first
  end
end