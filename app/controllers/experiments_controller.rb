class ExperimentsController < ApplicationController
  def index
    @experiments = Experiment.long_experiments
  end
end