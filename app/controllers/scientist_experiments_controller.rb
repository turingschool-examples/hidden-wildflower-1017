class ScientistExperimentsController < ApplicationController
  def destroy
    scientist_experiment = ScientistExperiment.find_by(scientist_id: params[:scientist_id], experiment_id: params[:experiment_id])
    scientist_experiment.destroy
    redirect_to show_scientist_path(params[:scientist_id])
  end
end
