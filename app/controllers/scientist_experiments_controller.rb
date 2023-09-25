class ScientistExperimentsController < ApplicationController
  def destroy
    @scientist_exp = ScientistExperiment.find_by(scientist_id: params[:scientist_id], experiment_id: params[:id])
    @scientist_exp.destroy
    redirect_to "/scientists/#{params[:scientist_id]}"
  end
end