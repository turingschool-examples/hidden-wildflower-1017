class ScientistExperimentController < ApplicationController
  def destroy
    # @scientist = Scientist.find(params[:scientist])
    # @expriment = Experiment.find(params[:id])
    @sci_exp = ScientistExperiment.find_entry((params[:scientist]),params[:id]).first.destroy
    redirect_to scientist_path(params[:scientist])
  end
end