class ScientistsController < ApplicationController
  def show
    @scientist = Scientist.find(params[:id])
  end

  def remove_experiment
    scientist = Scientist.find(params[:scientist_id])
    experiment = Experiment.find(params[:experiment_id])
    scientist.experiments.delete(experiment)
    redirect_to "/scientists/#{scientist.id}"
  end
end
