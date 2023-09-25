class ScientistExperiment < ApplicationRecord
  belongs_to :experiment
  belongs_to :scientist

  def self.find_entry(scientist_id, experiment_id)
    where(scientist: scientist_id, experiment: experiment_id)
  end
end