class ScientistExperimentsController < ApplicationController
  def destroy
    scientist_experiment = ScientistExperiment.find_by(scientist: params[:scientist_id], experiment_id: params[:experiment_id])
    scientist_experiment.destroy
    redirect_to "/scientists/#{params[:scientist_id]}"
  end
end