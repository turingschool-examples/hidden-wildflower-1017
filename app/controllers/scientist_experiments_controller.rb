class ScientistExperimentsController < ApplicationController
  def destroy
    ScientistExperiment.find_by(scientist_id: params[:scientist_id], experiment_id: params[:id]).destroy

    redirect_to scientist_path(params[:scientist_id])
  end
end