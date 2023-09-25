class ScientistExperimentsController < ApplicationController
  def destroy
    experiment = Experiment.find(params[:id])
    scientist = Scientist.find(params[:scientist_id])
    scientist_experiment = ScientistExperiment.find_by(scientist_id: scientist.id, experiment_id: experiment.id)
    scientist_experiment.destroy
    redirect_to "/scientists/#{scientist.id}"
  end
end
