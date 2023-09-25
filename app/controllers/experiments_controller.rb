class ExperimentsController < ApplicationController
  def index
    @experiments = Experiment.sort_by_num_months_longer_than_six
  end 
end