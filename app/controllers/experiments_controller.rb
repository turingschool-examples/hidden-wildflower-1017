class ExperimentsController < ApplicationController
  def index
    @experiments = Experiment.long

  end
end