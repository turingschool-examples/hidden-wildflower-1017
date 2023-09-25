class ScientistExperimentsController < ApplicationController
  def destroy
    ScientistExperiment.find_by(scientist_id: params[:id], experiment_id: params[:exp_id]).destroy
    redirect_to "/scientists/#{params[:id]}"
  end
end