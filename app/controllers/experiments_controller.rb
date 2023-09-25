class ExperimentsController < ApplicationController
  def destroy
    experiment = Experiment.find(params[:id])
    experiment.experiment_scientists.destroy_all
    experiment.destroy
    redirect_to "/scientists/#{params[:scientist_id]}"
  end
end