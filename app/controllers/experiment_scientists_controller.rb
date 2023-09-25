class ExperimentScientistsController < ApplicationController
  def destroy
    ExperimentScientist.assigned_exp_scientist(params[:scientist_id], params[:id]).destroy
    redirect_to "/scientists/#{params[:scientist_id]}"
  end
end