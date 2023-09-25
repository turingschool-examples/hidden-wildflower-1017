class ExperimentsController < ApplicationController
  def index
    @experiments = Experiment.experiment_length
  end
end