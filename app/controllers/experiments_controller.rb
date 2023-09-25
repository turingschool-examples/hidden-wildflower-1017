class ExperimentsController < ApplicationController
  def index
    @long_running_experiments = Experiment.long_running.order(num_months: :desc)
  end
end