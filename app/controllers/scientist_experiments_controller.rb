class ScientistExperimentsController < ApplicationController
  def delete
    ScientistExperiment.find(scientist_id: params[:id], experiment_id: params[:experiment_id])
    redirect_to "/scientists/#{scientist.id}"
  end
end