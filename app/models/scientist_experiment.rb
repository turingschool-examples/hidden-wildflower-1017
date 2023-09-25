class ScientistExperiment < ApplicationRecord
  belongs_to :experiment
  belongs_to :scientist
end