class ScientistExperimentsController < ApplicationController
  def destroy
    scientist = Scientist.find(params[:id])
    ScientistExperiment.find(ScientistExperiment.where(scientist_id: params[:id]).where(experiment_id: params[:experiment_id])[0].id).destroy
    redirect_to "/scientists/#{scientist.id}"
  end
end