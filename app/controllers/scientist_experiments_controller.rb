class ScientistExperimentsController < ApplicationController
  def destroy
    scientist = Scientist.find(params[:id])
    experiment = Experiment.find(params[:id])

    scientist.experiments.delete(experiment)

    redirect_to "/scientists/#{scientist.id}"
  end
end