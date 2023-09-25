class ExperimentsController < ApplicationController
  def index
    @experiments = Experiment.long_term_experiments

  end
end