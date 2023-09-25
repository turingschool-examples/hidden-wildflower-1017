class ScientistExperimentController < ApplicationController
  def destroy
    @sci_exp = ScientistExperiment.find_entry((params[:scientist]),params[:id]).first.destroy
    redirect_to scientist_path(params[:scientist])
  end
end