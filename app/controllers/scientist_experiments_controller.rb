class ScientistExperimentsController < ApplicationController
  def destroy
    ScientistExperiment.destroy(params[:id])
    redirect_to scientist_path(params[:scientist_id])
  end
end