class ExperimentsController < ApplicationController
  def index
    @experiments = Experiments.sort_by_num_months_longer_than_six
  end
end