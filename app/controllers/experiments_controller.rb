class ExperimentsController < ApplicationController
  def index
    @experiments = Experiment.long_running_descending
  end
end