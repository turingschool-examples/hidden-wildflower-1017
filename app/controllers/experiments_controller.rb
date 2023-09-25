class ExperimentsController < ApplicationController
  def index
    @experiments = Experiment.all
    @long_experiments = Experiment.long_experiments
  end
end