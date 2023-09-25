class ExperimentScientist < ApplicationRecord
  belongs_to :scientist
  belongs_to :experiment
  
  def self.assigned_exp_scientist(scientist_id, experiment_id)
    where("scientist_id = #{scientist_id} and experiment_id = #{experiment_id}")
    .first
  end
end