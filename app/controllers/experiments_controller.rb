class ExperimentsController < ApplicationController
  def index
    @experiments = Experiment.long_running
  end
end
