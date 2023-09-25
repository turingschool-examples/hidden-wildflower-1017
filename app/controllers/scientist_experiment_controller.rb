class ScientistExperimentController < ApplicationController
  def destroy
    @sci_exp = ScientistExperiment.find_entry((params[:format]),params[:id]).first.destroy
    redirect_to scientist_path(params[:format])
  end
end