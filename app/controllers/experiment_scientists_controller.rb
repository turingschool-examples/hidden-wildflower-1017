class ExperimentScientistsController < ApplicationController
  def destroy
    require 'pry';binding.pry
    scientist = Scientist.find(params[:scientist_id])
    experiment = Experiment.find(params[:experiment_id])
    
    scientist.experiments.delete(experiment)

    redirect_to "/scientists/#{@scientist.id}"
  end
end