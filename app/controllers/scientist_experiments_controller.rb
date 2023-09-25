class ScientistExperimentsController < ApplicationController
  def destroy
    experiment = ScientistExperiment.find_by(scientist_id: params[:scientist_id], experiment_id: params[:experiment_id])
    experiment.destroy
    redirect_to "/scientists/#{params[:scientist_id]}"
  end
end