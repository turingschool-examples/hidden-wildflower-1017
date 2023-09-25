class ScientistsController < ApplicationController
  def show
    @scientists = Scientist.find(params[:id])
  end

  def update
    @scientist = Scientist.find(params[:id])
    experiment = Experiment.find(params[:experiment_id])

    if @scientist.experiments.delete(experiment)
      redirect_to "/scientists/#{@scientist.id}"
    end
  end
end