class ExperimentScientist < ApplicationRecord
  belongs_to :scientist
  belongs_to :experiment, dependent: :destroy
end