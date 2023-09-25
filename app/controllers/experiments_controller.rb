class ExperimentsController < ApplicationController
  def index
    # require 'pry';binding.pry
    @experiments = Experiment.all
    @long_experiments = Experiment.long_experiments
  end
end